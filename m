From: b.galvani@gmail.com (Beniamino Galvani)
Date: Sun, 26 Nov 2017 11:14:59 +0100
Subject: [PATCH v2 1/5] ARM: arch-meson: add ethernet common init function
In-Reply-To: <5A193BBA.2080102@baylibre.com>
References: <1511357151-3771-1-git-send-email-narmstrong@baylibre.com>
 <1511357151-3771-2-git-send-email-narmstrong@baylibre.com>
 <CAPnjgZ1FaU5JBAuNv5nZGa0PjRyk-jYNeeoGTGN0Y_4q3_po8A@mail.gmail.com>
 <5A193BBA.2080102@baylibre.com>
Message-ID: <20171126101459.GA3519@gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Sat, Nov 25, 2017 at 10:45:30AM +0100, Neil Armstrong wrote:
> > 
> >> +               if (use_internal_phy) {
> >> +                       /* Use Internal PHY */
> >> +                       out_le32(GXBB_ETH_REG_2, 0x10110181);
> >> +                       out_le32(GXBB_ETH_REG_3, 0xe40908ff);
> >> +               }
> >> +#endif
> >> +
> >> +               break;
> >> +
> >> +       default:
> >> +               printf("Invalid Ethernet interface mode\n");
> >> +               return;
> >> +       }
> >> +
> >> +       /* Enable power and clock gate */
> >> +       setbits_le32(GXBB_GCLK_MPEG_1, GXBB_GCLK_MPEG_1_ETH);
> >> +       clrbits_le32(GXBB_MEM_PD_REG_0, GXBB_MEM_PD_REG_0_ETH_MASK);
> > 
> > Seems like this should be in a clock driver.
> 
> It should, in next release ? Beniamino's I2C driver also used this,
> but yes a proper clock driver becomes necessary here.

I have written a basic clock driver that allows to enable/disable
gates and get their frequency. Do you think this is enough? I will
submit it soon (hopefully later today).

Beniamino
