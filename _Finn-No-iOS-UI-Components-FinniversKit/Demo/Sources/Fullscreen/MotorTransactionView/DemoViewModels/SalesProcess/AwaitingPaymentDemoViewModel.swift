//
//  Created by Saleh-Jan, Robin on 28/02/2020.
//

import Foundation.NSString

extension MotorTransactionDefaultData {
    static var AwaitingPaymentDemoViewModel = MotorTransactionModel(
        title: "Salgsprosess",

        header: MotorTransactionHeaderModel(
            adId: "171529672",
            title: "BMW i3",
            registrationNumber: "CF40150",
            imagePath: "2020/2/vertical-0/26/2/171/529/672_525135443.jpg"),

        alert: MotorTransactionAlertModel(
            title: "Du har opprettet flere kontrakter for denne bilen",
            message: "En avtale er bindene når begge har signert. Prosessen under viser derfor prosessen for den første kontrakten begge signerte.",
            imageIdentifier: "MULTIPLE_CONTRACTS"
        ),

        steps: [
            MotorTransactionStepModel(
                state: .completed,
                style: .default,
                main: MotorTransactionStepContentModel(
                    title: "Annonsen er lagt ut",
                    primaryButton: MotorTransactionButtonModel(
                        text: "Se annonsen",
                        style: "FLAT",
                        action: "SEE_AD",
                        fallbackUrl: "/171529672"))),

            MotorTransactionStepModel(
                state: .completed,
                style: .default,
                main: MotorTransactionStepContentModel(
                    title: "Kontrakt",
                    body: NSAttributedString(string: "Begge har signert kontrakten."),
                    primaryButton: MotorTransactionButtonModel(
                        text: "Gå til kontrakt",
                        style: "FLAT",
                        url: "https://www.google.com/search?q=contract+signed"))),

            MotorTransactionStepModel(
                state: .active,
                main: MotorTransactionStepContentModel(
                    title: "Betaling",
                    body: NSAttributedString(string: "Venter på at kjøper skal betale."))),

            MotorTransactionStepModel(
                state: .notStarted,
                main: MotorTransactionStepContentModel(
                    title: "Overlevering",
                    body: NSAttributedString(string: "<p>Dere må møtes og bekrefte overleveringen innen 7 dager etter kjøper har betalt.</p><ol><li>Ved oppmøte registrerer dere først eierskiftet digitalt hos Statens vegvesen.</li><li>Deretter må begge bekrefte at overleveringen har skjedd, og at pengene kan utbetales.</li></ol>"))),

            MotorTransactionStepModel(
                state: .notStarted,
                style: .default,
                main: MotorTransactionStepContentModel(
                    title: "Gratulerer med salget!",
                    body: NSAttributedString(string: "Du kan finne igjen bilen i Mine kjøretøy under «Eide før»."))),
    ])
}
