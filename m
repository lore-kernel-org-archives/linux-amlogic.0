From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Sat,  2 Dec 2017 23:06:47 +0100
Subject: [RfC net-next 0/3] RTL8211F Ethernet PHY "documentation"
Message-ID: <20171202220650.23391-1-martin.blumenstingl@googlemail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

A recent patch from Heiner made me curious if the RTL8211F part of
the realtek.c PHY driver is correct: [0]
I contacted Realtek and asked if we could get a datasheet for the
RTL8211F PHY. it seems that the full datasheet can only be obtained
with an NDA. however, the contact at Realtek kindly answered all
questions I had regarding the RTL8211F PHY (thank you very much
again!). I am not permitted to share the exact answers I received,
but I am allowed to put them into my own words.

This series is a result of the conversation with Realtek: the main
intention behind this series is to *document* the information I got.
I am not aware of any board which needs the RX delay, has a problem
with the INTB pin configuration or requires any of the additional
interrupts.

I only tested that these patches don't break existing functionality
on Khadas VIM2 board with RTL8211F PHY.

PS: I also received information about the RTL8211E PHY's RX and TX
delay configuration. however, I don't understand that part of the
datasheet so I did not add any #defines in patch #3. the datasheet
says that:
- TX delay is configured through bit 12 and bit 13 in register 0x1c
  in page 0xa4 (value 1 = enabled, 0 = disabled)
- RX delay is configured through bit 11 and bit 13 in register 0x1c
  in page 0xa4 (value 1 = enabled, 0 = disabled)
I don't have any board with a RTL8211E PHY, so I could not test this
part at all. thus I don't know why bit 13 is listed for both, RX and
TX delay.

I do not expect that this series is applied. if someone is interested
in testing this: it applies on top of my other series:
"Realtek Ethernet PHY driver improvements" [1]


[0] https://www.spinics.net/lists/netdev/msg466661.html
[1] https://marc.info/?l=linux-netdev&m=151225151410593&w=2

Martin Blumenstingl (3):
  net: phy: realtek: add support for configuring the RX delay on
    RTL8211F
  net: phy: realtek: configure the INTB pin on RTL8211F
  net: phy: realtek: add more interrupt bits for RTL8211E and RTL8211F

 drivers/net/phy/realtek.c | 89 ++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 77 insertions(+), 12 deletions(-)

-- 
2.15.1
