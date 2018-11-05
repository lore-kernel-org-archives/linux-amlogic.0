From: carlo@caione.org (Carlo Caione)
Date: Mon, 05 Nov 2018 10:45:02 +0000
Subject: [PATCH v2 1/3] arm64: dts: meson-gxl: add support for phicomm n1
In-Reply-To: <20181104165054.oxgmocfntybp37v7@raspberrypi>
References: <20181104165054.oxgmocfntybp37v7@raspberrypi>
Message-ID: <503a3508428be1ab9c8ca401af2954cc8a8477fa.camel@caione.org>
To: linus-amlogic@lists.infradead.org
List-Id: linus-amlogic.lists.infradead.org

On Mon, 2018-11-05 at 00:50 +0800, He Yangxuan wrote:
> This patch adds support for the Phicomm N1. This device based on P230
> reference design.
> The phy is RTL8211F, need to disable Energy Efficient Ethernet (EEE)
> to make it stable.
> And this box doesn't have cvbs, so disable related section in device
> tree.
> 
> Changes since v1:
>  - rewrite external_phy section

Probably it's better if you keep the changes recap out of the commit
message.

Thanks.

--
Carlo Caione
