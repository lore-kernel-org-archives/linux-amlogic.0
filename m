From: martin.blumenstingl@googlemail.com (Martin Blumenstingl)
Date: Thu, 12 Oct 2017 23:08:16 +0200
Subject: [RFC usb-next v5 2/3] usb: core: add a wrapper for the USB PHYs
 on the root-hub
In-Reply-To: <20171008211713.18696-3-martin.blumenstingl@googlemail.com>
References: <20171008211713.18696-1-martin.blumenstingl@googlemail.com>
 <20171008211713.18696-3-martin.blumenstingl@googlemail.com>
Message-ID: <CAFBinCDp-QK0jQEL9EHBqN-M4VPg0nA49rdUa_D7mM-KFMhJRQ@mail.gmail.com>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Sun, Oct 8, 2017 at 11:17 PM, Martin Blumenstingl
<martin.blumenstingl@googlemail.com> wrote:
[snip]
> +struct usb_phy_roothub *usb_phy_roothub_init(struct device *dev)
> +{
> +       struct device_node *roothub_np, *port_np;
> +       struct usb_phy_roothub *phy_roothub;
> +       struct usb_phy_roothub *roothub_entry;
> +       struct list_head *head;
> +       int err;
> +
> +       roothub_np = usb_of_get_child_node(dev->of_node, ROOTHUB_PORTNUM);
> +       if (!of_device_is_available(roothub_np)) {
> +               dev_err(dev, "no roothub node found\n");
Xiaolong Ye's kbuild test robot found this dev_err() which shouldn't
be there. I'll remove it in the next version - thanks for spotting
this!

> +               return NULL;
> +       }
> +
[snip]
