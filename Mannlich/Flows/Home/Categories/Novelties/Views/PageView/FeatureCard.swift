import SwiftUI

struct FeatureCard: View {
    var announcement: Announcement

    var body: some View {
        announcement.image
            .resizable()
            .aspectRatio(3 / 2, contentMode: .fit)
            .overlay {
                TextOverlay(announcement: announcement)
            }
    }
}

struct TextOverlay: View {
    var announcement: Announcement
    
    var gradient: LinearGradient {
        .linearGradient(
                Gradient(colors: [.black.opacity(0.6), .black.opacity(0)]),
                startPoint: .bottom,
                endPoint: .center)
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            gradient
            VStack(alignment: .leading) {
                Text(announcement.topic)
                    .font(.title)
                    .bold()
                Text(announcement.date.stringDate)
            }
            .padding()
        }
        .foregroundColor(.white)
    }
}

struct FeatureCard_Previews: PreviewProvider {
    static var previews: some View {
        FeatureCard(announcement: Announcement(topic: "Test", content: "Test", date: Date(), image: Image("test_image")))
    }
}
