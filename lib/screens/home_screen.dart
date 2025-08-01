import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:iconly/iconly.dart';
import '../models/crypto_asset.dart';
import '../widgets/asset_item.dart';
import '../widgets/glass_action_button.dart';
import '../widgets/menu_item.dart';
import '../widgets/trend_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final zoomDrawerController = ZoomDrawerController();

  final List<CryptoAsset> _cryptoAssets = [
    CryptoAsset(
      name: "Bitcoin",
      symbol: "BTC",
      price: 51275.80,
      change: 2.4,
      holdings: 0.45,
      color: const Color(0xFFF7931A),
    ),
    CryptoAsset(
      name: "Ethereum",
      symbol: "ETH",
      price: 2835.65,
      change: -1.2,
      holdings: 4.75,
      color: const Color(0xFF627EEA),
    ),
    CryptoAsset(
      name: "Solana",
      symbol: "SOL",
      price: 142.20,
      change: 5.7,
      holdings: 28.5,
      color: const Color(0xFF00FFA3),
    ),
    CryptoAsset(
      name: "Cardano",
      symbol: "ADA",
      price: 0.58,
      change: 1.8,
      holdings: 1250.0,
      color: const Color(0xFF0033AD),
    ),
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return ZoomDrawer(
      controller: zoomDrawerController,
      menuBackgroundColor: isDark ? colorScheme.surface : Colors.white,
      shadowLayer1Color:
          isDark ? colorScheme.surfaceVariant : const Color(0xFFF5F5F5),
      shadowLayer2Color:
          isDark
              ? colorScheme.surfaceVariant.withOpacity(0.7)
              : const Color(0xFFE6E6E6).withOpacity(0.3),
      borderRadius: 32.0,
      showShadow: true,
      style: DrawerStyle.defaultStyle,
      angle: -12.0,
      drawerShadowsBackgroundColor:
          isDark ? Colors.black38 : Colors.grey.shade300,
      slideWidth: MediaQuery.of(context).size.width * 0.7,
      menuScreen: _buildMenuScreen(context),
      mainScreen: _buildMainScreen(context),
    );
  }

  Widget _buildMenuScreen(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Card with Profile Picture and Email
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: isDark ? colorScheme.surface : Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  // Profile Picture
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: colorScheme.primary,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.network(
                        'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?w=900&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fG1hbnxlbnwwfHwwfHx8MA%3D%3D',
                        fit: BoxFit.cover,
                        width: 60,
                        height: 60,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Email and Name
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hammad Ali",
                          style: textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colorScheme.onSurface,
                          ),
                        ),
                        Text(
                          "hammadaali.dev@gmail.com",
                          style: textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            // Menu items
            MenuItem(
              title: "Portfolio",
              icon: IconlyBold.chart,
              isSelected: _selectedIndex == 0,
              onTap: () {
                setState(() {
                  _selectedIndex = 0;
                });
                zoomDrawerController.toggle?.call();
              },
            ),
            MenuItem(
              title: "Market",
              icon: IconlyBold.graph,
              isSelected: _selectedIndex == 1,
              onTap: () {
                setState(() {
                  _selectedIndex = 1;
                });
                zoomDrawerController.toggle?.call();
              },
            ),
            MenuItem(
              title: "Transactions",
              icon: IconlyBold.swap,
              isSelected: _selectedIndex == 2,
              onTap: () {
                setState(() {
                  _selectedIndex = 2;
                });
                zoomDrawerController.toggle?.call();
              },
            ),
            MenuItem(
              title: "News",
              icon: IconlyBold.paper,
              isSelected: _selectedIndex == 3,
              onTap: () {
                setState(() {
                  _selectedIndex = 3;
                });
                zoomDrawerController.toggle?.call();
              },
            ),
            MenuItem(
              title: "Settings",
              icon: IconlyBold.setting,
              isSelected: _selectedIndex == 4,
              onTap: () {
                setState(() {
                  _selectedIndex = 4;
                });
                zoomDrawerController.toggle?.call();
              },
            ),
            const Spacer(),
            // Logout button
            Padding(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: colorScheme.errorContainer,
                  foregroundColor: colorScheme.error,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 0,
                ),
                icon: const Icon(Icons.logout_rounded),
                label: Text(
                  "Log out",
                  style: textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMainScreen(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: colorScheme.background,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => zoomDrawerController.toggle?.call(),
                        icon: Icon(
                          IconlyBold.category,
                          color: colorScheme.onBackground,
                          size: 28,
                        ),
                        style: IconButton.styleFrom(
                          backgroundColor:
                              isDark
                                  ? colorScheme.surfaceVariant.withOpacity(0.5)
                                  : colorScheme.primaryContainer.withOpacity(
                                    0.2,
                                  ),
                          padding: const EdgeInsets.all(8),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        "Portfolio",
                        style: textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.onBackground,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          IconlyBold.search,
                          color: colorScheme.onBackground,
                          size: 28,
                        ),
                        style: IconButton.styleFrom(
                          backgroundColor:
                              isDark
                                  ? colorScheme.surfaceVariant.withOpacity(0.5)
                                  : colorScheme.primaryContainer.withOpacity(
                                    0.2,
                                  ),
                          padding: const EdgeInsets.all(8),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Stack(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              IconlyBold.notification,
                              color: colorScheme.onBackground,
                              size: 28,
                            ),
                            style: IconButton.styleFrom(
                              backgroundColor:
                                  isDark
                                      ? colorScheme.surfaceVariant.withOpacity(
                                        0.5,
                                      )
                                      : colorScheme.primaryContainer
                                          .withOpacity(0.2),
                              padding: const EdgeInsets.all(8),
                            ),
                          ),
                          Positioned(
                            top: 8,
                            right: 8,
                            child: Container(
                              width: 12,
                              height: 12,
                              decoration: BoxDecoration(
                                color: colorScheme.error,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: colorScheme.background,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  // Portfolio value card
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [colorScheme.primary, const Color(0xFF9F7FFF)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(28),
                      boxShadow: [
                        BoxShadow(
                          color: colorScheme.primary.withOpacity(0.3),
                          blurRadius: 20,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Total Portfolio Value",
                                style: textTheme.titleMedium?.copyWith(
                                  color: Colors.white.withOpacity(0.8),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: colorScheme.secondary.withOpacity(0.2),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      IconlyBold.arrow_up_2,
                                      size: 16,
                                      color: colorScheme.secondary,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      "3.2%",
                                      style: textTheme.bodyMedium?.copyWith(
                                        color: colorScheme.secondary,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "\$42,582",
                                style: textTheme.headlineLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 36,
                                ),
                              ),
                              const SizedBox(width: 4),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 6),
                                child: Text(
                                  ".65",
                                  style: textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white.withOpacity(0.8),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GlassActionButton(
                                label: "Deposit",
                                icon: IconlyBold.arrow_down_2,
                                color: colorScheme.secondary,
                              ),
                              GlassActionButton(
                                label: "Withdraw",
                                icon: IconlyBold.arrow_up_2,
                                color: Colors.white,
                              ),
                              GlassActionButton(
                                label: "Swap",
                                icon: IconlyBold.swap,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Market trends section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Market Trends",
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.onBackground,
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          foregroundColor: colorScheme.primary,
                          side: BorderSide(
                            color: colorScheme.primary.withOpacity(0.5),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                        ),
                        child: Row(
                          children: [
                            Text(
                              "See All",
                              style: textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(width: 4),
                            const Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 12,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Market trend cards
                  SizedBox(
                    height: 150,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        TrendCard(
                          symbol: "BTC",
                          price: 51275.80,
                          change: 2.4,
                          coinColor: const Color(0xFFF7931A),
                        ),
                        TrendCard(
                          symbol: "ETH",
                          price: 2835.65,
                          change: -1.2,
                          coinColor: const Color(0xFF627EEA),
                        ),
                        TrendCard(
                          symbol: "SOL",
                          price: 142.20,
                          change: 5.7,
                          coinColor: const Color(0xFF00FFA3),
                        ),
                        TrendCard(
                          symbol: "ADA",
                          price: 0.58,
                          change: 1.8,
                          coinColor: const Color(0xFF0033AD),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Your assets section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Your Assets",
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.onBackground,
                        ),
                      ),
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          foregroundColor: colorScheme.primary,
                          side: BorderSide(
                            color: colorScheme.primary.withOpacity(0.5),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                        ),
                        child: Row(
                          children: [
                            Text(
                              "See All",
                              style: textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(width: 4),
                            const Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 12,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Asset list
                  ..._cryptoAssets.map((asset) {
                    return AssetItem(asset: asset);
                  }).toList(),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        onPressed: () {},
        child: const Icon(IconlyBold.plus, size: 28),
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: isDark ? colorScheme.surface : Colors.white,
        indicatorColor: colorScheme.primaryContainer,
        elevation: 0,
        height: 70,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(IconlyLight.chart),
            selectedIcon: Icon(IconlyBold.chart),
            label: 'Portfolio',
          ),
          NavigationDestination(
            icon: Icon(IconlyLight.graph),
            selectedIcon: Icon(IconlyBold.graph),
            label: 'Market',
          ),
          NavigationDestination(
            icon: Icon(IconlyLight.swap),
            selectedIcon: Icon(IconlyBold.swap),
            label: 'Trade',
          ),
          NavigationDestination(
            icon: Icon(IconlyLight.paper),
            selectedIcon: Icon(IconlyBold.paper),
            label: 'News',
          ),
          NavigationDestination(
            icon: Icon(IconlyLight.setting),
            selectedIcon: Icon(IconlyBold.setting),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
