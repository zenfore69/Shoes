using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Shoes
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            lblUserInfo.Text = $"Пользователь: {CurrentUser.FullName} Роль: {CurrentUser.Role}" ;

            ApplyRoleRestrictions();

            LoadProducts();

            if (CurrentUser.Role == "Администратор" || CurrentUser.Role == "Менеджер")
            {
                LoadOrders();
            }
        }

        private void ApplyRoleRestrictions()
        {
            SearchFilterPanel.Visibility = Visibility.Collapsed;
            AdminButtonsPanel.Visibility = Visibility.Collapsed;
            OrdersTabItem.Visibility = Visibility.Collapsed;

            switch (CurrentUser.Role)
            {
                case "Гость":
                case "Авторизированный клиент":
                    break;

                case "Менеджер":
                    SearchFilterPanel.Visibility = Visibility.Visible;
                    OrdersTabItem.Visibility = Visibility.Visible;
                    break;

                case "Администратор":
                    SearchFilterPanel.Visibility = Visibility.Visible;
                    OrdersTabItem.Visibility = Visibility.Visible;
                    AdminButtonsPanel.Visibility = Visibility.Visible;
                    break;
            }
        }

        private void LoadProducts()
        {

        }

        private void LoadOrders()
        {

        }

        private void btnExit_Click(object sender, RoutedEventArgs e)
        {
            CurrentUser.Role = "";
            CurrentUser.FullName = "";
            OpenAuthWindow();
        }

        private void OpenAuthWindow()
        {
            Autorisation Auth = new Autorisation();
            Auth.Show();
            this.Close();
        }
    }
}
