Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC257C38142
	for <linux-amlogic@archiver.kernel.org>; Wed,  1 Feb 2023 16:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8JNP6PcfcT+cjrFKGV5+8jjWNkk7hWwFcOo1mrfpr3c=; b=gtJsdG2d4x8XEr
	j+FqKjMCyP12Bpx24o85U1dvfalTxXLwVEXB0g/Wu4MNg69n9i2C5MRygY8HpbRcqkMi4EgTcaH3L
	MdI/9GbIu6wlq5gsSDpgrR0yrRDcJ7VVViKGaJrdtdBVE31pUyfHjCwk/d+iMneKhSg9+puWW8rAm
	kx1MELBLq7CiZbm0TqHAjLOABEGMtiptM2dSLS4ND+3CXOPh3GfzB/zMDMmUJZDVHWqq1N050iIGv
	2Yis6oFBfTogyKlQbPc9gQHZAHVLF/R2l/ok+qocsdtdiUwjAlgcC1flM5LXDwOPXZ9pVOg8qm9ZW
	4GUyQnmSC5SRydUZzwLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNFai-00Ci9u-3f; Wed, 01 Feb 2023 16:04:08 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pI3hN-00HRmB-1F; Wed, 18 Jan 2023 08:21:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1674030092; x=1705566092;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=2Pi2FhYms8rU5qm8xKHkMWUh3m1gamMEnH3Omx98304=;
  b=UlhasIbja8Z+aerB7F2ZmMZwuO/ZFl0sWyzZZlHkWtodje9I9VFtM9vN
   PfARl0mAfmTpHhlN92ctDLueznD6+U8nGT2RsZJn3ZibYjYy6ri8qKVVa
   wScMjBxko7dFSsGAnrAA1X/L6jLc5MfZk6D4wZN717CLsk89VbB+dhKBZ
   rMb0H/51LUKVn8logTA5B8KosLpc9USGpMHQWsUcdyybuymng8HdfGUOq
   x2tqVo/t4h/NX3EDli/J6MxVC0oEvvz36bhyIfrgF42hUVjmF/bVA9fiB
   CjGT/tdt51+/36DRxA4WuEQkZ/AEJBWUc1YGBKsPq2FBCoEcdJNloW2mA
   w==;
X-IronPort-AV: E=Sophos;i="5.97,224,1669100400"; 
   d="scan'208";a="196300402"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 18 Jan 2023 01:21:27 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 18 Jan 2023 01:21:26 -0700
Received: from den-dk-m31857.microchip.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.16 via Frontend Transport; Wed, 18 Jan 2023 01:21:07 -0700
Message-ID: <7eb58e2459715a6b2bb5eb45e2ce1f1e88050dff.camel@microchip.com>
Subject: Re: [PATCH v2 13/23] arm64: dts: Update cache properties for
 microchip
From: Steen Hegelund <steen.hegelund@microchip.com>
To: Pierre Gondois <pierre.gondois@arm.com>, <linux-kernel@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Florian Fainelli <f.fainelli@gmail.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, "Tsahee
 Zidenberg" <tsahee@annapurnalabs.com>, Antoine Tenart <atenart@kernel.org>,
	Brijesh Singh <brijeshkumar.singh@amd.com>, Suravee Suthikulpanit
	<suravee.suthikulpanit@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>,
	"Neil Armstrong" <neil.armstrong@linaro.org>, Kevin Hilman
	<khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>, Khuong Dinh
	<khuong@os.amperecomputing.com>, Liviu Dudau <liviu.dudau@arm.com>, "Sudeep
 Holla" <sudeep.holla@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
	William Zhang <william.zhang@broadcom.com>, Anand Gore
	<anand.gore@broadcom.com>, Kursad Oney <kursad.oney@broadcom.com>,
	=?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, Alim Akhtar
	<alim.akhtar@samsung.com>, Shawn Guo <shawnguo@kernel.org>, Li Yang
	<leoyang.li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	"NXP Linux Team" <linux-imx@nxp.com>, Chester Lin <clin@suse.com>, Andreas
 =?ISO-8859-1?Q?F=E4rber?= <afaerber@suse.de>, Matthias Brugger
	<mbrugger@suse.com>, NXP S32 Linux Team <s32@nxp.com>, Wei Xu
	<xuwei5@hisilicon.com>, Chanho Min <chanho.min@lge.com>, Andrew Lunn
	<andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, "Sebastian
 Hesselbarth" <sebastian.hesselbarth@gmail.com>, Lars Povlsen
	<lars.povlsen@microchip.com>, Daniel Machon <daniel.machon@microchip.com>,
	<UNGLinuxDriver@microchip.com>, Avi Fishman <avifishman70@gmail.com>, "Tomer
 Maimon" <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, "Patrick
 Venture" <venture@google.com>, Nancy Yuen <yuenn@google.com>, Benjamin Fair
	<benjaminfair@google.com>, Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, Andy Gross <agross@kernel.org>,
	"Bjorn Andersson" <andersson@kernel.org>, Konrad Dybcio
	<konrad.dybcio@somainline.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu
	<mhiramat@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, Nishanth Menon
	<nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo
	<kristo@kernel.org>, Viorel Suman <viorel.suman@nxp.com>, Abel Vesa
	<abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, Ming Qian
	<ming.qian@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>, Adam Ford
	<aford173@gmail.com>, Tim Harvey <tharvey@gateworks.com>, Lucas Stach
	<l.stach@pengutronix.de>, Richard Zhu <hongxing.zhu@nxp.com>, Li Jun
	<jun.li@nxp.com>, Markus Niebel <Markus.Niebel@ew.tq-group.com>, Joakim Zhang
	<qiangqing.zhang@nxp.com>, Marek Vasut <marex@denx.de>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>, Alexander Stein
	<alexander.stein@ew.tq-group.com>, Paul Elder <paul.elder@ideasonboard.com>,
	Martin Kepplinger <martink@posteo.de>, David Heidelberg <david@ixit.cz>, "Joy
 Zou" <joy.zou@nxp.com>, Oliver Graute <oliver.graute@kococonnector.com>, "Liu
 Ying" <victor.liu@nxp.com>, Zhou Peng <eagle.zhou@nxp.com>, Shijie Qin
	<shijie.qin@nxp.com>, Wei Fang <wei.fang@nxp.com>, Jacky Bai
	<ping.bai@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>, Chris Packham
	<chris.packham@alliedtelesis.co.nz>, Vadym Kochan <vadym.kochan@plvision.eu>,
	Sameer Pujar <spujar@nvidia.com>, Akhil R <akhilrajeev@nvidia.com>, "Mikko
 Perttunen" <mperttunen@nvidia.com>, Prathamesh Shete <pshete@nvidia.com>,
	Sumit Gupta <sumitg@nvidia.com>, Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Vidya Sagar <vidyas@nvidia.com>, Ashish Mhetre <amhetre@nvidia.com>, "Johan
 Jonker" <jbx6244@gmail.com>, Christopher Obbard <chris.obbard@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Aswani Reddy
	<aswani.reddy@samsung.com>, Shashank Prashar <s.prashar@samsung.com>, "Arnd
 Bergmann" <arnd@arndb.de>, <devicetree@vger.kernel.org>,
	<linux-rpi-kernel@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-samsung-soc@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<openbmc@lists.ozlabs.org>, <linux-tegra@vger.kernel.org>,
	<linux-arm-msm@vger.kernel.org>, <linux-realtek-soc@lists.infradead.org>,
	<linux-renesas-soc@vger.kernel.org>, <linux-rockchip@lists.infradead.org>
Date: Wed, 18 Jan 2023 09:21:07 +0100
In-Reply-To: <20221107155825.1644604-14-pierre.gondois@arm.com>
References: <20221107155825.1644604-1-pierre.gondois@arm.com>
	 <20221107155825.1644604-14-pierre.gondois@arm.com>
User-Agent: Evolution 3.46.3 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230118_002133_234851_16FF1FFB 
X-CRM114-Status: GOOD (  15.47  )
X-Mailman-Approved-At: Wed, 01 Feb 2023 08:04:05 -0800
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGkgUGllcnJlLAoKVGhpcyBsb29rcyBnb29kIHRvIG1lLgoKUmV2aWV3ZWQtYnk6IFN0ZWVuIEhl
Z2VsdW5kIDxTdGVlbi5IZWdlbHVuZEBtaWNyb2NoaXAuY29tPgoKQlIKU3RlZW4KCk9uIE1vbiwg
MjAyMi0xMS0wNyBhdCAxNjo1NyArMDEwMCwgUGllcnJlIEdvbmRvaXMgd3JvdGU6Cj4gRVhURVJO
QUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5
b3Uga25vdyB0aGUKPiBjb250ZW50IGlzIHNhZmUKPiAKPiBUaGUgRGV2aWNlVHJlZSBTcGVjaWZp
Y2F0aW9uIHYwLjMgc3BlY2lmaWVzIHRoYXQgdGhlIGNhY2hlIG5vZGUKPiAnY29tcGF0aWJsZScg
YW5kICdjYWNoZS1sZXZlbCcgcHJvcGVydGllcyBhcmUgJ3JlcXVpcmVkJy4gQ2YuCj4gczMuOCBN
dWx0aS1sZXZlbCBhbmQgU2hhcmVkIENhY2hlIE5vZGVzCj4gVGhlICdjYWNoZS11bmlmaWVkJyBw
cm9wZXJ0eSBzaG91bGQgYmUgcHJlc2VudCBpZiBvbmUgb2YgdGhlCj4gcHJvcGVydGllcyBmb3Ig
dW5pZmllZCBjYWNoZSBpcyBwcmVzZW50ICgnY2FjaGUtc2l6ZScsIC4uLikuCj4gCj4gVXBkYXRl
IHRoZSBEZXZpY2UgVHJlZXMgYWNjb3JkaW5nbHkuCj4gCj4gU2lnbmVkLW9mZi1ieTogUGllcnJl
IEdvbmRvaXMgPHBpZXJyZS5nb25kb2lzQGFybS5jb20+Cj4gLS0tCj4gwqBhcmNoL2FybTY0L2Jv
b3QvZHRzL21pY3JvY2hpcC9zcGFyeDUuZHRzaSB8IDEgKwo+IMKgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvYm9vdC9kdHMvbWljcm9j
aGlwL3NwYXJ4NS5kdHNpCj4gYi9hcmNoL2FybTY0L2Jvb3QvZHRzL21pY3JvY2hpcC9zcGFyeDUu
ZHRzaQo+IGluZGV4IDJkZDVlMzg4MjBiMS4uYzRiY2EyM2I5NmI5IDEwMDY0NAo+IC0tLSBhL2Fy
Y2gvYXJtNjQvYm9vdC9kdHMvbWljcm9jaGlwL3NwYXJ4NS5kdHNpCj4gKysrIGIvYXJjaC9hcm02
NC9ib290L2R0cy9taWNyb2NoaXAvc3Bhcng1LmR0c2kKPiBAQCAtNTIsNiArNTIsNyBAQCBjcHUx
OiBjcHVAMSB7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH07Cj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIEwyXzA6IGwyLWNhY2hlMCB7Cj4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb21wYXRpYmxlID0gImNhY2hlIjsKPiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY2FjaGUtbGV2ZWwg
PSA8Mj47Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH07Cj4gwqDCoMKgwqDCoMKg
wqAgfTsKPiAKPiAtLQo+IDIuMjUuMQo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9n
aWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
