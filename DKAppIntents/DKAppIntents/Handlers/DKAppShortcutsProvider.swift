import AppIntents

struct DKAppShortcutsProvider: AppShortcutsProvider {
    static var appShortcuts: [AppShortcut] {
        AppShortcut(
            intent: DKAppIntent(),
            phrases: ["\(.applicationName) \(\.$appEntity)"],
            shortTitle: "DKAppIntent",
            systemImageName: "fork.knife",
            parameterPresentation: ParameterPresentation(
                for: \.$appEntity,
                summary: Summary("Open \(\.$appEntity)"),
                optionsCollections: {
                    OptionsCollection(DKDefaultEntityQuery(), title: "DKAppIntent", systemImageName: "fork.knife")
                }
            )
        )
    }
}
