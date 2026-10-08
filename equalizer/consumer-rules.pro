# equalizer 的依赖策略：
# - verticalseekbar 0.7.0 的类由 fattenReleaseAar 物理打进 AAR（含补齐的 stub R 类）；
# - williamchart 2.2 由 POM 传递依赖提供（build.gradle 中以 api 声明，消费方按坐标依赖
#   equalizer 时自动解析）——其官方 AAR 的资源引用指向 com.db.williamchart 包，
#   只有正常 AAR 依赖才能由 AGP 正确生成 R 类，故不能物理打进 AAR。
# 以下 keep 规则防止消费方 R8 误删/混淆这些类
# （com.db.chart 的 keep 同时保护 RoundedLineChartView 反射访问的 LineChartView 内部字段）。
-keep class com.db.chart.** { *; }
-keep class com.h6ah4i.android.widget.verticalseekbar.** { *; }
