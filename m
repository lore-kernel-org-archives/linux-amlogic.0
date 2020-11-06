Return-Path: <SRS0=MpPN=EM=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CC62C2D0A3
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Nov 2020 09:17:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D24982087E
	for <linux-amlogic@archiver.kernel.org>; Fri,  6 Nov 2020 09:17:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KcoDPgTC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Y6h+CXqa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D24982087E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=samsung.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:MIME-Version:Date:Message-ID:
	From:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=61bBu0T9jfI96JnmRVpGluE2GBbe9/G25fI+IWzEwIY=; b=KcoDPgTC4FfCP75NFfZiXfX13
	N+xjmADKgNfW59QY84qbHulYu7bGYBtY+ex+NuPW5FMgjAjlQ9fSG23l5eVuMVtq2ZfN11YNRT8qD
	nR53Kqj5BvxRUTptrH+H/LzNv7dpoU0T+0IOcJ+I437qzTxLwu2xwY8f46hYSwPK0zqS2z8Cr651r
	zyhShXWyTpKdKUHh9ERE4y4hAiPpk1jHF2sXZoamZYl32SCbapRNpAoJrR0762rYo07ENq+Cqf2Zs
	Jvl7A7ObXta8zCRUBsBojqyaVkb+HksHylSUmHbhEraM6tNlQpUcnRL9YSorzDKyMGVVMUDPIMOp2
	imm8xSV8g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaxsD-0006O3-96; Fri, 06 Nov 2020 09:17:33 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaxs9-0006NR-RT; Fri, 06 Nov 2020 09:17:31 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20201106091710euoutp01a3fb7590aca570993f4a71758223f76f~E4IVSALMF2336123361euoutp01e;
 Fri,  6 Nov 2020 09:17:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20201106091710euoutp01a3fb7590aca570993f4a71758223f76f~E4IVSALMF2336123361euoutp01e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1604654230;
 bh=21wqxFY+rhYS7yfUh8u/AU7V25NfuFEGtP4GBPEKnXw=;
 h=Subject:To:Cc:From:Date:In-Reply-To:References:From;
 b=Y6h+CXqae5RH+BSOW3H1AtuM3Ioge/g5HLaAYmrFFhr5fSyXaZXINpWxkg8uJu/0c
 ayH/ceU5wtWhh0HDBnCPv22xucBr3oWyd19XF28WZWA5Lwsg2bRH0BieE6r/D97TdV
 KYCwGfsWoQoDQxliuzFQl4sJk11mQt0OVJmIpNlA=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20201106091710eucas1p2392018640bed2c247a4025f5a6516892~E4IVIS7PL0939709397eucas1p2S;
 Fri,  6 Nov 2020 09:17:10 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id DE.08.06456.69415AF5; Fri,  6
 Nov 2020 09:17:10 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20201106091709eucas1p10f775cacfc6a9cb543ddd3b2cb942ea3~E4IUrokrW1109811098eucas1p1p;
 Fri,  6 Nov 2020 09:17:09 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20201106091709eusmtrp291c39170ab698e044b401f3d1e32edba~E4IUqMtjb1088010880eusmtrp29;
 Fri,  6 Nov 2020 09:17:09 +0000 (GMT)
X-AuditID: cbfec7f2-7efff70000001938-07-5fa5149652aa
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 74.EF.06017.59415AF5; Fri,  6
 Nov 2020 09:17:09 +0000 (GMT)
Received: from [106.210.88.143] (unknown [106.210.88.143]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20201106091707eusmtip2901eab6f443cb51ab65bf86ae986876a~E4ISgzA1o0792207922eusmtip24;
 Fri,  6 Nov 2020 09:17:07 +0000 (GMT)
Subject: Re: [PATCH v2 00/16] PCI: dwc: Another round of clean-ups
To: Rob Herring <robh@kernel.org>, Lorenzo Pieralisi
 <lorenzo.pieralisi@arm.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <7eb813b3-41cc-a88c-0261-ba31995aaeb4@samsung.com>
Date: Fri, 6 Nov 2020 10:17:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0)
 Gecko/20100101 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201105211159.1814485-1-robh@kernel.org>
Content-Language: en-US
X-Brightmail-Tracker: H4sIAAAAAAAAA01TbUxTZxTO23t776Vadq24vqvGLZ1ZsmUKDJKd6OKU7MdNjI7MuewjyCpe
 PjKo2oobujhW6ia1KGimcGtr6WpABswVBMG6skJaGYE6UeyW4oRCBhPR8DECTB3lQsa/53nO
 c95znpO8DKG4QKuYLO1BXqfVZKspGdngm+5afzbmYmrcUM0y6ArPkuA0ZEKHZ5SEvjvvQnPv
 cRpagwYEQoMVwUh/GwF/eQUCKifKaDAKDhLu/TOGoOq7JhJOhR8QMP1tvQRuDpopCAQu03Df
 +rsE7JZl4PFfkoAr3COFEk8nDaaZSwRYnKdI6LT5KSgN/CyBwgmBgtmpp1IYmR2i4WRRCwU+
 RzsJJ1pT4cqJuxLwnvwEbCW3KXjmvjo3fsCB4Emji4SheiWMzAQJuO78AKabbSQUjozS0NMo
 h8Cx0jn53jiCX64lbInlKm+apFxb9Q+Iq7ZVI+5ubTL3KHiM5mzVR7gmoZfm7K5cbrD4DM2F
 rT/RnKuqkOJCPW6Kq3N+xQVKyxHn8pwluKKCUSr5+Y9lb+3ls7MO8brYzZ/KMg2OuP3+l74w
 9LVK8lGVyoSiGMwm4sFuI2VCMkbBViJsra1ZIBMItza0kyIZR7guVI4WW4LFtyVioQLhi0U+
 WiSPEC6abJeaEMOsZJNw6NzrkYYY9j3cfKOCiHgI9jyDA+Hr88++wP4mxQ+sdknERbHx2PTQ
 REWwnN2MT98Ym9dJdh0u77YQEbyK3YOfjP9LiJ4VuL1sgIzgKPZNXDPZM68T7Iu44IplASvx
 HwMX5lfFbJkMG7+eJMUM72Bj/2VCxCvx3/56WsRr8LOmxYYChPu6amiRmBHuNpQuXGATDnXN
 UJGcBPsq/rE5VpS3Ys9j87yM2WgcfLhCXCIan244R4iyHB//RiG6X8GCv5YuRi8LS+IISyII
 SyII/8+yI7IKKflcfU4Gr4/X8p9v0Gty9LnajA1p+3JcaO7bdDz1j11Fk7f2eBHLIPVyectH
 zlSFVHNIn5fjRZgh1DHypM6O3Qr5Xk3eYV63L1WXm83rvWg1Q6qV8gTHcIqCzdAc5D/j+f28
 brEqYaJU+QhZps5vS87aHppV3V/jW9t77UDa0R2Jq/I6hpcfUX6f3r/zy5SRyjNtLRkGqfHA
 xpIdH65NcfmNCdFmefr2po7hX3fvzLszpUlrWWcu121cv8ubXKESDtftUm96Wzq1LZwpe//W
 c0rfFkV67VH7G2OjUrevrNGdiB//qXXH5Rd3a5LUpD5TE/8aodNr/gNXvT04MgQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA02TbUxTVxiAd+69vffWreNaYJyxZTONicumLQWxL0YJMdm8+7FMZ7Ko4Loq
 N5SMtqYfZm4/RnBOKCjgBoM2VCyVSEXnKkr5cNXiQMawJGqtTEiRGnGrbHNupjJlLXUJ/56c
 8zznIzmHJaXn6Uy2VG8WjHpNmYxeQo08HZpc1ZB2TJ117+eVcGV6jgJXhRZGfLMUTF1/H3on
 KhkYCFUgsJ1rQRC9fYmEu34bCccfNjPwpc1JweQ/DxC4G3ooqJ3+jYTYgS4Cxu7U0BAInGYg
 3HKTgFb78+Ab6iDAMx0UQb1vlAHr4w4S7K5aCkYdQzQ0BX4goOqhjYa5R09FEJ2bYeDQwQs0
 DDqHKageUMPZ6hsE+A8VgqP+Gg3z/d749hEngifdHgpmujIg+jhEwnnXhxDrdVBQFZ1lINgt
 gcD+pvjw5F8ILvblFCj442NWEX+p8wTiOx2diL9xahP/e2g/wzs6P+d7bBMM3+qx8Hfqvmb4
 6ZbvGd7jrqL5W8F+mj/j+oIPNB1FvMfXSPIH983Sm17aLl9nNFjMwjKtwWReLytUQrZcmQfy
 7NV5cmWOasfa7FyZIn9dsVBWukcwKvI/lmsrnFm7h5Z9WjE1QJQjd6YViVnMrcahumuEFS1h
 pdwxhJ94I2Ry4lU83FguSnIq/jdopZPSfYTH++YZK2LZVG4DvvXtyoSTxn2A+640ihIOyTlZ
 3F4bXghe5q6KcLutjUzWVoQHOr9BiYTmlNh6P7GsmJVw+fjw5QdEgiluOT561b5wjHRuJ743
 1kAknaV4uDlCJVjMqfDJv4MLDsmtwY4zU8/4dbzvrP0ZZ+DxyBGiDqXaFuW2RYltUWJblLQi
 yo3SBItJV6IzZctNGp3Joi+R7zLoPCj+dM8Nxrq8yDq7xY84FslekFzY5lJLRZo9pr06P8Is
 KUuTbBgd+UgqKdbs/UwwGtRGS5lg8qPc+OXqycz0XYb4R9Cb1cpcpQrylKocVc4akGVIKrmL
 RVKuRGMWPhGE3YLx/45gxZnl6J2frq+Y7257e25HQeVzRT2PlntvC1ulO7eIs74qMihr7O7v
 Ii+e3FZTvDHAehW9f2b9OjWoDKWM+WKqvjAV21zySrTUlbI0ZXPKa1oy4/CJFev54a3pf0wq
 3girCl2rDsy89WM1FrV13A2PNm9ce+Td05d/kd7sL4D292SFxvGJRr2MMmk1yjdJo0nzH0ER
 /SvQAwAA
X-CMS-MailID: 20201106091709eucas1p10f775cacfc6a9cb543ddd3b2cb942ea3
X-Msg-Generator: CA
X-RootMTR: 20201105211208eucas1p29087cdd73805e670aff9f3a43f644e05
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20201105211208eucas1p29087cdd73805e670aff9f3a43f644e05
References: <CGME20201105211208eucas1p29087cdd73805e670aff9f3a43f644e05@eucas1p2.samsung.com>
 <20201105211159.1814485-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_041730_002069_89E39397 
X-CRM114-Status: GOOD (  21.01  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-pci@vger.kernel.org,
 Binghui Wang <wangbinghui@hisilicon.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-tegra@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-arm-kernel@axis.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jonathan Chocron <jonnyc@amazon.com>, Shawn Guo <shawnguo@kernel.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, Fabio Estevam <festevam@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>, Jesper Nilsson <jesper.nilsson@axis.com>,
 linux-samsung-soc@vger.kernel.org, Minghuan Lian <minghuan.Lian@nxp.com>,
 Kevin Hilman <khilman@baylibre.com>, Pratyush Anand <pratyush.anand@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 Kukjin Kim <kgene@kernel.org>, Mingkai Hu <mingkai.hu@nxp.com>,
 Xiaowei Song <songxiaowei@hisilicon.com>, NXP Linux Team <linux-imx@nxp.com>,
 Richard Zhu <hongxing.zhu@nxp.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-arm-msm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
 Yue Wang <yue.wang@Amlogic.com>, Murali Karicheri <m-karicheri2@ti.com>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-amlogic@lists.infradead.org,
 linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Roy Zang <roy.zang@nxp.com>, Masahiro Yamada <yamada.masahiro@socionext.com>,
 Jingoo Han <jingoohan1@gmail.com>, Andy Gross <agross@kernel.org>,
 Vidya Sagar <vidyas@nvidia.com>, Stanimir Varbanov <svarbanov@mm-sol.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 linuxppc-dev@lists.ozlabs.org, Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

SGkgUm9iLAoKT24gMDUuMTEuMjAyMCAyMjoxMSwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gSGVyZSdz
IGFub3RoZXIgYmF0Y2ggb2YgRFdDIFBDSSBob3N0IHJlZmFjdG9yaW5nLiBUaGlzIHNlcmllcyBw
cmltYXJpbHkKPiBtb3ZlcyBtb3JlIG9mIHRoZSBNU0ksIGxpbmsgdXAsIGFuZCByZXNvdXJjZSBo
YW5kbGluZyB0byB0aGUgY29yZQo+IGNvZGUuIEJleW9uZCBhIGNvdXBsZSBvZiBtaW5vciBmaXhl
cywgbmV3IGluIHRoaXMgdmVyc2lvbiBpcyBydW50aW1lCj4gZGV0ZWN0aW9uIG9mIGlBVFUgcmVn
aW9ucyBpbnN0ZWFkIG9mIHVzaW5nIERUIHByb3BlcnRpZXMuCgppQVRVIGRldGVjdGlvbiBzZWVt
cyB0byB3b3JrIGZpbmUgd2l0aCAKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtc2Ftc3Vu
Zy1zb2MvMjAyMDEwMjkxMzQwMTcuMjc0MDAtMS1tLnN6eXByb3dza2lAc2Ftc3VuZy5jb20vIApv
biB0b3Agb2YgeW91ciBwYXRjaHNldCBvbiBTYW1zdW5nIEV4eW5vczU0MzMgU29DOgoKZXh5bm9z
LXBjaWUgMTU3MDAwMDAucGNpZTogaG9zdCBicmlkZ2UgL3NvY0AwL3BjaWVAMTU3MDAwMDAgcmFu
Z2VzOgpleHlub3MtcGNpZSAxNTcwMDAwMC5wY2llOsKgwqDCoMKgwqDCoCBJTyAweDAwMGMwMDEw
MDAuLjB4MDAwYzAxMGZmZiAtPiAKMHgwMDAwMDAwMDAwCmV4eW5vcy1wY2llIDE1NzAwMDAwLnBj
aWU6wqDCoMKgwqDCoCBNRU0gMHgwMDBjMDExMDAwLi4weDAwMGZmZmZmZmUgLT4gCjB4MDAwYzAx
MTAwMApleHlub3MtcGNpZSAxNTcwMDAwMC5wY2llOiBpQVRVIHVucm9sbDogZGlzYWJsZWQKZXh5
bm9zLXBjaWUgMTU3MDAwMDAucGNpZTogRGV0ZWN0ZWQgaUFUVSByZWdpb25zOiAzIG91dGJvdW5k
LCA1IGluYm91bmQKZXh5bm9zLXBjaWUgMTU3MDAwMDAucGNpZTogTGluayB1cApleHlub3MtcGNp
ZSAxNTcwMDAwMC5wY2llOiBQQ0kgaG9zdCBicmlkZ2UgdG8gYnVzIDAwMDA6MDAKCkZlbGwgZnJl
ZSB0byBhZGQgbXk6CgpUZXN0ZWQtYnk6IE1hcmVrIFN6eXByb3dza2kgPG0uc3p5cHJvd3NraUBz
YW1zdW5nLmNvbT4KCj4gTm8gZG91YnQgSSd2ZSBwcm9iYWJseSBicm9rZW4gc29tZXRoaW5nLiBQ
bGVhc2UgdGVzdC4gSSd2ZSBydW4gdGhpcyB0aHJ1Cj4ga2VybmVsY2kgYW5kIGNoZWNrZWQgYm9h
cmRzIHdpdGggRFdDIFBDSSB3aGljaCBjdXJyZW50bHkgaXMganVzdAo+IExheWVyc2NhcGUgYm9h
cmRzIChoaW50OiBhZGQgYm9hcmRzIGFuZC9vciBlbmFibGUgUENJKS4gQSBnaXQgYnJhbmNoIGlz
Cj4gaGVyZVsxXS4KPgo+IFRoaXMgaXMgZGVwZW5kZW50IG9uICJQQ0k6IGR3YzogUmVzdG9yZSBB
VFUgbWVtb3J5IHJlc291cmNlIHNldHVwIHRvIHVzZQo+IGxhc3QgZW50cnkiIHdoaWNoIHdpbGwg
YmUgaW4gdjUuMTAtcmMzLgo+Cj4gUm9iCj4KPiBbMV0gZ2l0Oi8vZ2l0Lmtlcm5lbC5vcmcvcHVi
L3NjbS9saW51eC9rZXJuZWwvZ2l0L3JvYmgvbGludXguZ2l0IHBjaS1tb3JlLWR3Yy1jbGVhbnVw
Cj4KPiBSb2IgSGVycmluZyAoMTYpOgo+ICAgIFBDSTogZHdjOiBTdXBwb3J0IG11bHRpcGxlIEFU
VSBtZW1vcnkgcmVnaW9ucwo+ICAgIFBDSTogZHdjL2ludGVsLWd3OiBNb3ZlIEFUVSBvZmZzZXQg
b3V0IG9mIGRyaXZlciBtYXRjaCBkYXRhCj4gICAgUENJOiBkd2M6IE1vdmUgImRiaSIsICJkYmky
IiwgYW5kICJhZGRyX3NwYWNlIiByZXNvdXJjZSBzZXR1cCBpbnRvCj4gICAgICBjb21tb24gY29k
ZQo+ICAgIFBDSTogZHdjL2ludGVsLWd3OiBSZW1vdmUgc29tZSB1bm5lZWRlZCBmdW5jdGlvbiB3
cmFwcGVycwo+ICAgIFBDSTogZHdjOiBFbnN1cmUgYWxsIG91dGJvdW5kIEFUVSB3aW5kb3dzIGFy
ZSByZXNldAo+ICAgIFBDSTogZHdjL2RyYTd4eDogVXNlIHRoZSBjb21tb24gTVNJIGlycV9jaGlw
Cj4gICAgUENJOiBkd2M6IERyb3AgdGhlIC5zZXRfbnVtX3ZlY3RvcnMoKSBob3N0IG9wCj4gICAg
UENJOiBkd2M6IE1vdmUgTVNJIGludGVycnVwdCBzZXR1cCBpbnRvIERXQyBjb21tb24gY29kZQo+
ICAgIFBDSTogZHdjOiBSZXdvcmsgTVNJIGluaXRpYWxpemF0aW9uCj4gICAgUENJOiBkd2M6IE1v
dmUgbGluayBoYW5kbGluZyBpbnRvIGNvbW1vbiBjb2RlCj4gICAgUENJOiBkd2M6IE1vdmUgZHdf
cGNpZV9tc2lfaW5pdCgpIGludG8gY29yZQo+ICAgIFBDSTogZHdjOiBNb3ZlIGR3X3BjaWVfc2V0
dXBfcmMoKSB0byBEV0MgY29tbW9uIGNvZGUKPiAgICBQQ0k6IGR3YzogUmVtb3ZlIHVubmVjZXNz
YXJ5IHdyYXBwZXJzIGFyb3VuZCBkd19wY2llX2hvc3RfaW5pdCgpCj4gICAgUmV2ZXJ0ICJQQ0k6
IGR3Yy9rZXlzdG9uZTogRHJvcCBkdXBsaWNhdGVkICdudW0tdmlld3BvcnQnIgo+ICAgIFBDSTog
ZHdjOiBNb3ZlIGluYm91bmQgYW5kIG91dGJvdW5kIHdpbmRvd3MgdG8gY29tbW9uIHN0cnVjdAo+
ICAgIFBDSTogZHdjOiBEZXRlY3QgbnVtYmVyIG9mIGlBVFUgd2luZG93cwo+Cj4gICBkcml2ZXJz
L3BjaS9jb250cm9sbGVyL2R3Yy9wY2ktZHJhN3h4LmMgICAgICAgfCAxNDEgKy0tLS0tLS0tLS0t
LS0tLS0tCj4gICBkcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2ktZXh5bm9zLmMgICAgICAg
fCAgNTAgKystLS0tLQo+ICAgZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpLWlteDYuYyAg
ICAgICAgIHwgIDM5ICstLS0tCj4gICBkcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9wY2kta2V5
c3RvbmUuYyAgICAgfCAgNzkgKystLS0tLS0tLQo+ICAgLi4uL3BjaS9jb250cm9sbGVyL2R3Yy9w
Y2ktbGF5ZXJzY2FwZS1lcC5jICAgIHwgIDM3ICstLS0tCj4gICBkcml2ZXJzL3BjaS9jb250cm9s
bGVyL2R3Yy9wY2ktbGF5ZXJzY2FwZS5jICAgfCAgNjcgKy0tLS0tLS0tCj4gICBkcml2ZXJzL3Bj
aS9jb250cm9sbGVyL2R3Yy9wY2ktbWVzb24uYyAgICAgICAgfCAgNTMgKystLS0tLQo+ICAgZHJp
dmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1hbC5jICAgICAgICAgIHwgIDI5ICstLS0KPiAg
IGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtYXJtYWRhOGsuYyAgICB8ICAzNyArKy0t
LQo+ICAgZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1hcnRwZWM2LmMgICAgIHwgIDc2
ICstLS0tLS0tLS0KPiAgIC4uLi9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1kZXNpZ253YXJlLWVw
LmMgICB8ICA1OCArKystLS0tCj4gICAuLi4vcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtZGVzaWdu
d2FyZS1ob3N0LmMgfCAxMzkgKysrKysrKysrKy0tLS0tLS0KPiAgIC4uLi9wY2kvY29udHJvbGxl
ci9kd2MvcGNpZS1kZXNpZ253YXJlLXBsYXQuYyB8ICA3MCArLS0tLS0tLS0KPiAgIGRyaXZlcnMv
cGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtZGVzaWdud2FyZS5jICB8ICA5MyArKysrKysrKysrKy0K
PiAgIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtZGVzaWdud2FyZS5oICB8ICAyNCAr
LS0KPiAgIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtaGlzdGIuYyAgICAgICB8ICAz
NyArKy0tLQo+ICAgZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1pbnRlbC1ndy5jICAg
IHwgIDY3ICsrLS0tLS0tLQo+ICAgZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1raXJp
bi5jICAgICAgIHwgIDYyICstLS0tLS0tCj4gICBkcml2ZXJzL3BjaS9jb250cm9sbGVyL2R3Yy9w
Y2llLXFjb20uYyAgICAgICAgfCAgMzggKy0tLS0KPiAgIGRyaXZlcnMvcGNpL2NvbnRyb2xsZXIv
ZHdjL3BjaWUtc3BlYXIxM3h4LmMgICB8ICA2MiArKystLS0tLQo+ICAgZHJpdmVycy9wY2kvY29u
dHJvbGxlci9kd2MvcGNpZS10ZWdyYTE5NC5jICAgIHwgIDQxICstLS0tCj4gICBkcml2ZXJzL3Bj
aS9jb250cm9sbGVyL2R3Yy9wY2llLXVuaXBoaWVyLWVwLmMgfCAgMzggKy0tLS0KPiAgIGRyaXZl
cnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtdW5pcGhpZXIuYyAgICB8ICA1MSArLS0tLS0tCj4g
ICAyMyBmaWxlcyBjaGFuZ2VkLCAzNTYgaW5zZXJ0aW9ucygrKSwgMTAzMiBkZWxldGlvbnMoLSkK
Pgo+IC0tCj4gMi4yNS4xCj4KQmVzdCByZWdhcmRzCi0tIApNYXJlayBTenlwcm93c2tpLCBQaEQK
U2Ftc3VuZyBSJkQgSW5zdGl0dXRlIFBvbGFuZAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFt
bG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
