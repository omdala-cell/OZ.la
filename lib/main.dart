import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(const OzlaApp());

const navy = Color(0xFF0B1F3A);
const blue = Color(0xFF17446B);
const pale = Color(0xFFF3F6FA);

class KnowledgeSite {
  final String name, subtitle, url;
  final IconData icon;
  const KnowledgeSite(this.name, this.subtitle, this.url, this.icon);
}

const sites = <KnowledgeSite>[
  KnowledgeSite('OZPay.LA', 'Payment Systems', 'https://sites.google.com/view/ozpay-la/home', Icons.account_balance_wallet_outlined),
  KnowledgeSite('OZBank', 'Finance, Monetary & Banking', 'https://sites.google.com/view/ozbank/home', Icons.account_balance_outlined),
  KnowledgeSite('OZDX.LA', 'Digital Transformation', 'https://sites.google.com/view/ozdx-la/home', Icons.devices_outlined),
  KnowledgeSite('OZReg.LA', 'Laws & Regulations', 'https://sites.google.com/view/ozreg-la/home', Icons.gavel_outlined),
  KnowledgeSite('OZCIB.LA', 'Credit Information', 'https://sites.google.com/view/ozcib-la/home', Icons.database_outlined),
  KnowledgeSite('OZDI.LA', 'Deposit Insurance', 'https://sites.google.com/view/ozdi-la/home', Icons.shield_outlined),
];

class OzlaApp extends StatelessWidget {
  const OzlaApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'OZ.LA',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(seedColor: navy, primary: navy),
      scaffoldBackgroundColor: pale,
      appBarTheme: const AppBarTheme(backgroundColor: navy, foregroundColor: Colors.white),
      cardTheme: CardThemeData(color: Colors.white, elevation: 0, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18))),
    ),
    home: const MainShell(),
  );
}

class MainShell extends StatefulWidget {
  const MainShell({super.key});
  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int tab = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: IndexedStack(index: tab, children: const [HomePage(), DirectoryPage(), AboutPage()])),
      bottomNavigationBar: NavigationBar(
        selectedIndex: tab,
        onDestinationSelected: (v) => setState(() => tab = v),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.grid_view_outlined), selectedIcon: Icon(Icons.grid_view), label: 'Knowledge'),
          NavigationDestination(icon: Icon(Icons.info_outline), selectedIcon: Icon(Icons.info), label: 'About'),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(slivers: [
      SliverToBoxAdapter(child: Container(
        padding: const EdgeInsets.fromLTRB(22, 22, 22, 26),
        decoration: const BoxDecoration(color: navy, borderRadius: BorderRadius.vertical(bottom: Radius.circular(28))),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [
            Container(width: 46, height: 46, alignment: Alignment.center, decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(14)), child: const Text('OZ', style: TextStyle(color: navy, fontSize: 20, fontWeight: FontWeight.w900))),
            const SizedBox(width: 12),
            const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('OZ.LA', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 21)),
              Text('Financial & Digital Knowledge Platform', style: TextStyle(color: Color(0xFFD5E2F0), fontSize: 11)),
            ]),
          ]),
          const SizedBox(height: 28),
          const Text('Knowledge for a\nDigital Financial Future', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 27, height: 1.15)),
          const SizedBox(height: 10),
          const Text('ສູນລວມຄວາມຮູ້ວິຊາການ ດ້ານການເງິນ ແລະ ດິຈິຕອນ', style: TextStyle(color: Color(0xFFD5E2F0), fontSize: 13)),
          const SizedBox(height: 18),
          FilledButton.icon(
            style: FilledButton.styleFrom(backgroundColor: Colors.white, foregroundColor: navy),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SitePage(site: sites[0]))),
            icon: const Icon(Icons.explore_outlined), label: const Text('Explore knowledge'),
          )
        ]),
      )),
      const SliverToBoxAdapter(child: Padding(padding: EdgeInsets.fromLTRB(20, 24, 20, 12), child: Text('Knowledge Categories', style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold, color: navy)))),
      SliverPadding(padding: const EdgeInsets.fromLTRB(16, 0, 16, 24), sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate((context, i) => SiteCard(site: sites[i]), childCount: sites.length),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12, childAspectRatio: 1.12),
      )),
      const SliverToBoxAdapter(child: Padding(padding: EdgeInsets.fromLTRB(20, 0, 20, 28), child: Text('OZ.LA brings six specialist knowledge libraries together in one mobile experience.', style: TextStyle(color: Colors.black54, height: 1.5)))),
    ]);
  }
}

class DirectoryPage extends StatelessWidget {
  const DirectoryPage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: pale,
    appBar: AppBar(title: const Text('Knowledge Library')),
    body: ListView.separated(
      padding: const EdgeInsets.all(16), itemCount: sites.length, separatorBuilder: (_, __) => const SizedBox(height: 10),
      itemBuilder: (context, i) => Card(child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: CircleAvatar(backgroundColor: const Color(0xFFE8EEF5), foregroundColor: navy, child: Icon(sites[i].icon)),
        title: Text(sites[i].name, style: const TextStyle(fontWeight: FontWeight.bold, color: navy)),
        subtitle: Text(sites[i].subtitle),
        trailing: const Icon(Icons.chevron_right),
        onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => SitePage(site: sites[i]))),
      )),
    ),
  );
}

class SiteCard extends StatelessWidget {
  final KnowledgeSite site;
  const SiteCard({super.key, required this.site});
  @override
  Widget build(BuildContext context) => Card(
    child: InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => SitePage(site: site))),
      child: Padding(padding: const EdgeInsets.all(15), child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(width: 42, height: 42, decoration: BoxDecoration(color: const Color(0xFFEAF0F7), borderRadius: BorderRadius.circular(13)), child: Icon(site.icon, color: navy)),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(site.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: navy)),
          const SizedBox(height: 4),
          Text(site.subtitle, style: const TextStyle(fontSize: 11, color: Colors.black54), maxLines: 2, overflow: TextOverflow.ellipsis),
        ]),
      ])),
    ),
  );
}

class SitePage extends StatefulWidget {
  final KnowledgeSite site;
  const SitePage({super.key, required this.site});
  @override
  State<SitePage> createState() => _SitePageState();
}

class _SitePageState extends State<SitePage> {
  late final WebViewController controller;
  bool loading = true;
  int progress = 0;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        onProgress: (p) => setState(() => progress = p),
        onPageStarted: (_) => setState(() => loading = true),
        onPageFinished: (_) => setState(() => loading = false),
        onWebResourceError: (_) => setState(() => loading = false),
        onNavigationRequest: (request) {
          final uri = Uri.tryParse(request.url);
          if (uri != null && (uri.scheme == 'http' || uri.scheme == 'https')) return NavigationDecision.navigate;
          return NavigationDecision.prevent;
        },
      ))
      ..loadRequest(Uri.parse(widget.site.url));
  }

  Future<bool> handleBack() async {
    if (await controller.canGoBack()) {
      await controller.goBack();
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) => PopScope(
    canPop: false,
    onPopInvokedWithResult: (didPop, result) async {
      if (!didPop && await handleBack() && context.mounted) Navigator.pop(context);
    },
    child: Scaffold(
      appBar: AppBar(
        title: Text(widget.site.name),
        actions: [
          IconButton(tooltip: 'Open in browser', icon: const Icon(Icons.open_in_browser), onPressed: () async {
            final uri = Uri.parse(widget.site.url);
            await launchUrl(uri, mode: LaunchMode.externalApplication);
          }),
          IconButton(tooltip: 'Refresh', icon: const Icon(Icons.refresh), onPressed: () => controller.reload()),
        ],
      ),
      body: Column(children: [
        if (loading) LinearProgressIndicator(value: progress == 0 ? null : progress / 100, minHeight: 2),
        Expanded(child: WebViewWidget(controller: controller)),
      ]),
    ),
  );
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('About OZ.LA')),
    body: ListView(padding: const EdgeInsets.all(22), children: const [
      SizedBox(height: 18),
      Center(child: Icon(Icons.auto_awesome, size: 58, color: navy)),
      SizedBox(height: 18),
      Center(child: Text('OZ.LA', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: navy))),
      SizedBox(height: 8),
      Center(child: Text('Financial & Digital Knowledge Platform', textAlign: TextAlign.center, style: TextStyle(color: Colors.black54))),
      SizedBox(height: 24),
      Text('OZ.LA connects specialist knowledge websites covering payment systems, finance and banking, digital transformation, laws and regulations, credit information, and deposit insurance.', style: TextStyle(height: 1.6)),
      SizedBox(height: 18),
      Text('Version 1.0.0', style: TextStyle(color: Colors.black54)),
    ]),
  );
}
