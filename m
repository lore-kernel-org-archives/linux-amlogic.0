Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBF9606A320
	for <linux-amlogic@archiver.kernel.org>; Sat, 21 Nov 2026 20:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SlDWWdK4;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=g4nwBI0l;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vTIu6fDd
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5YokQ6YWHmRjGoZS95JEDBDz3MlXalh+NzSuQnAZQXk=; b=SlDWWdK4ykCIkgeV1pfYpsR+XV
	KXvpdGn1I+LqEwPLzZFhXFULgXuLdkLeKrj6AXS1u1ate04ziYpOsRF8d+NXSPQKVQQUJ8Qm4gfOU
	baCqz4/AIltwyIuy1AnyDDN2uJ3xg30UqJxhOhn8tDheEvJY5OwUkIv1sheXzUXVLd0EQpGvioTZl
	7ky0dk/SD31G/Bsai59TQFStCSXGkxOD1XzqO89V4c7w1wEDPGKjt4GDoK+ztAgSzIJpgEyX0HdFQ
	sRh6i3lfgJQ8nIobiAsZyTuC6cuKz6jGy8KJ7GNalidObOir2PbquBeJbM5e+Ckw8WaNMsTwxZPPM
	8qenbbVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUrvx-00000000GGe-3OeI;
	Sat, 21 Nov 2026 20:43:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUrvv-00000000GG3-2IYl
	for linux-amlogic@bombadil.infradead.org;
	Sat, 21 Nov 2026 20:43:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=uQdPu5z2EGJ4csNcE/ZMXtBS35QjemgectDDwKWjhJM=; b=g4nwBI0lPWGCi0oTxDlr3dOKIg
	FkDvw04i3eckxclgegMTO0S0i7NGmqpCy5F/fdSnyrd0NO1uvAoIbDMM9L1wNwpfgmNNaeahTYWQ5
	B+FVR5XOjo2VWFzuwcyNx9ro4A4TUnuSz6M9TDHxZ0w6YvzcV7alWsQ1YZqZPuxOaj9HuAIBdMeDs
	SfDmQuHQu6u1wRIaNYSGBkdWgr1NsQgunhpE4RJ3JqpyHBn5qVuhk6if7CLcJfgHnFMYBAVRibd5q
	2YB0hYqcGP9K0ZSWY/apkzrSBVfTNkh8anFTakclgtnEyKUFL/kamU17m5m4Ya19BlEW41UrnvYZI
	LX167qpw==;
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUrtr-00000001o6y-455j
	for linux-amlogic@lists.infradead.org;
	Sat, 21 Nov 2026 20:43:38 +0000
Received: by mail-vs1-xe32.google.com with SMTP id ada2fe7eead31-7cc91ddf447so740717137.2
        for <linux-amlogic@lists.infradead.org>; Sat, 21 Nov 2026 12:41:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795293686; cv=none;
        d=google.com; s=arc-20260327;
        b=N5wwq1HrYgg+lqEWjsYbFSdn+uBbmRSR30uLXyZl9fbmQb1HG15pItebOg7vFG6fcl
         TiD5mdZ2I5zD3bPkxKZTCfNAv0WlL2LJ4ubM4b6YB2FvuRoOLuKLW9wmYFpBoK2t707R
         hSOJp0wPrhAF1qqh8Ix+M/5hOhH5pgGRybGXQOIDziWo9ZxDomnaamR0oRT/dLiWu8el
         JhmT1xv0jNR8/1BJMZgpmb/HHRiNTaF4IKzqtf1TsHGsSL98B6rCzmvVthUiFY2jPwgK
         w0tlgV4hVnUSpM37sfbUHVfOl0J28pdVaNyD5SE5jnlnJ1fHJ96gNAn5YxF2ouy6F9gV
         H1ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uQdPu5z2EGJ4csNcE/ZMXtBS35QjemgectDDwKWjhJM=;
        fh=XBLNWHTiPRJkaLGqCQj1ZQaV7vEBgFzAHySW4k39DTY=;
        b=DVw19qdhwMX+P/KsTNHvJ8xiYgi9tpm+VLHijYMzUni1oroQfqHh1KcIN8uNDyii2P
         3DMjwxwb99Vs50j75kMsz+yhEeMZVQfmICpjxkd6TShXSuQkiA5c8zWuiwxn5YtD38Tf
         GpgD7kvuIUUOtn/vWxr5kzoqxkeceMiV7kwnE3GL8wQgQUcS9OU02CMIq8GRd1Mkuq3m
         ACP2Ku3bc0hDZTdhZT05Z9QC6uL40x7JyWZLHt1QBewHAsQMLoI3EXEqD+KfM0dcsv0P
         hjB06oDwWHaGIxUzduPwOi1XPk4fCfx6muBeC0g1tThNbs6Zf7nf5CY3IL5/NbAqB8Gw
         OLxw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795293686; x=1795898486; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uQdPu5z2EGJ4csNcE/ZMXtBS35QjemgectDDwKWjhJM=;
        b=vTIu6fDdd2u73luwD0nhgGCStA/Yff9UYk8V3Awvah9AIzIk3P4zJPei1aNEjNnOPq
         8HTm/YQqDl/lejOTKVEWtn8yTr9Oo5h/e4ymwquWVHgPW2A6YmKCk/qMrR4f+htQmws7
         PvAzWq6dAvljvzI+QoAtXWSmqzGYcgDHl0e6U9XjnJP2Q6V9p2UINvcWnOiVjZpxyFl8
         pOWPswGj7d5fAWBWjqcBqsCb5KQo4JQloBhRhI4U8NEvmZWhTbgoRyKt+NN5GKwRzNKq
         xR41WQJMuKpskQg5e5V8kTAfmfEM8j8iyGvzLQD9+VipmIhGs9gqH80lZrJqxocrZdjU
         waEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795293686; x=1795898486;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uQdPu5z2EGJ4csNcE/ZMXtBS35QjemgectDDwKWjhJM=;
        b=Dzc51pf04wK4vKQDbHu7stYSu9mdDRrnJDXoNlnkFdMDpw0Y3+NoN+W6c5hE4S60bf
         mHKv8mmGmZBHWpijCoiDRrSCCtQaeQyavcQ0CBcOh+aaxMjJebdaDlb72CwX/U1zgzd0
         C1KKNeKkAmLIFYX35iN6CEwn0FFvrpcCzHEBkcbM7iGF4BS8Hk5JaxYjoifM6PKySOGf
         uvaYzx7cDcGi4GBXutJ8ipL5+NdR4lr1d/cEnA4miiPMnxaZ+VMMqhWi0rm/fzEUKasD
         68k8uG2GnzeBK2YcxrwsHkalutYStEsr5LMSoJZywUX76+o8AuwtGCCbAMifZkKKHoZ/
         k3Mg==
X-Forwarded-Encrypted: i=1; AL+hErFMA+0wNpZo0v+8TRwbkumb4CQ7IRsBk6KrZJmkA4Z18cSO9elb2qDITZF1tRrbw2bKmABrC8zG+2goFlwN@lists.infradead.org
X-Gm-Message-State: APuU4Z/IQC5dJv5WpdX/AdkPQV7QzrHQ+Cm7Hfz5teSNGdVZmzW1dbGy
	jc/uYMo+ACbJNqnJRNz8mUxP7S8ukOrm1JOsQgSzGmVQi+iEym5p3UiCc6d7QnLiqFTdGl7FDTj
	6ZLuGxMNs7eqAkdhab28f/ThHgF8pLXI=
X-Gm-Gg: AZFdTZc3bX/0JPE0ufKm9AMnMMu78NLKKINmp15/50LFwsrba0CRKT0oB1na5Wp4uHC
	uEWrt1SyfiR+A7Ro21V2gezptq9VA+zKc6oO36DGcB6TUZJI7akeALVnz8ddTH13SKir3uuWSHf
	FT4uzy7diia7K8Ju1z3MJZ+dpW5DUI3uSYDwJW+b8h306E83f/yjlnNxqO+RDehKMmxtgRJsiRU
	EGvDc8VGu31xMmfvOfTbTUVFYyUPUg0M5jb/c+785ar7A5ZQPzX/cKH0xhyf60RteXlfbZt6inH
	xfTeNOsJAif5z8+9zeu7wJltn/dWYxUAoCVHXME14v/RXNfM/04ORIKa5SZDM53GtBu/L5irWOO
	JeAPTROB2slslCWihztq6qKbM/pnXopazv1ffh5poCjWxC4zvfMukMtU3ias+iraX30PvU3K9GB
	PcsW2stRR00sXHEy2BSkOS3ITrX72vOrsOaBaScle2Rw8gLjYpuR/C7G0ueLtT6k1vLMPCSaTjG
	COAx460I+8f8nlnkooNQygLZPWYlQ==
X-Received: by 2002:a05:6102:2ad1:b0:7c4:a0e4:1a79 with SMTP id
 ada2fe7eead31-7d7395c2401mr2651293137.19.1795293685637; Sat, 21 Nov 2026
 12:41:25 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
 <87v75tc7i5.fsf@bootlin.com>
In-Reply-To: <87v75tc7i5.fsf@bootlin.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 21 Nov 2026 13:41:14 -0700
X-Gm-Features: Aa3M54oFXYK5vYkufMa20MNvSVURFxi72uRFVRNsrbS-Gdn6Fv1aeUhFqCfOY8s
Message-ID: <CADvTj4opS_oL0AZjL=eBArgpbqtyH-MQxxSC1KdTxDm88OXpKw@mail.gmail.com>
Subject: Re: [PATCH v5 00/58] mtd: rawnand: retain chip and controller state
 across removal
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Tze Yee Ng <tze.yee.ng@altera.com>, 
	Richard Cochran <richardcochran@gmail.com>, Jonathan Lemon <jonathan.lemon@gmail.com>, 
	Vadim Fedorenko <vadim.fedorenko@linux.dev>, Yuqiang Sun <izaiahsun@gmail.com>, 
	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Bernhard Frauendienst <kernel@nospam.obeliks.de>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
	Kees Cook <kees@kernel.org>, linux-hardening@vger.kernel.org, 
	Arseniy Krasnov <AVKrasnov@sberdevices.ru>, Boris Brezillon <bbrezillon@kernel.org>, 
	Brian Norris <computersforpeace@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@kernel.org>, 
	David Woodhouse <dwmw2@infradead.org>, Thomas Gleixner <tglx@kernel.org>, 
	Vitaly Wool <vitalywool@gmail.com>, David Woodhouse <David.Woodhouse@intel.com>, 
	Russell King <rmk+kernel@arm.linux.org.uk>, Mike Rapoport <rppt@kernel.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Christophe Kerello <christophe.kerello@st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Jason Roberts <jason.e.roberts@intel.com>, Boris Brezillon <boris.brezillon@collabora.com>, 
	Michal Simek <michal.simek@amd.com>, Mason Yang <masonccyang@mxic.com.tw>, 
	Ramuthevar Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>, Lucas Stach <dev@lynxeye.de>, 
	Dmitry Osipenko <digetx@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
	Stefan Agner <stefan@agner.ch>, Thierry Reding <thierry.reding@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>, linux-mediatek@lists.infradead.org, 
	Matthias Brugger <matthias.bgg@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
	linux-rockchip@lists.infradead.org, Yifeng Zhao <yifeng.zhao@rock-chips.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Keguang Zhang <keguang.zhang@gmail.com>, 
	linux-mips@vger.kernel.org, Shan-Chun Hung <schung@nuvoton.com>, 
	Jacky Huang <ychuang3@nuvoton.com>, Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	imx@lists.linux.dev, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Han Xu <han.xu@nxp.com>, 
	linux-renesas-soc@vger.kernel.org, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Kevin Hilman <khilman@baylibre.com>, Liang Yang <liang.yang@amlogic.com>, 
	linux-amlogic@lists.infradead.org, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org, 
	Manivannan Sadhasivam <mani@kernel.org>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Kamal Dasu <kamal.dasu@broadcom.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
	Vladimir Zapolskiy <vz@mleia.com>, Harvey Hunt <harveyhuntnexus@gmail.com>, 
	Paul Cercueil <paul@crapouillou.net>, Maxim Levitsky <maximlevitsky@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261121_204146_087542_1579FAAD 
X-CRM114-Status: GOOD (  41.67  )
X-Spam-Score: 0.1 (/)
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
X-Spam-Status: No, score=-0.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVGh1LCBOb3YgMTksIDIwMjYgYXQgNTo0OeKAr0FNIE1pcXVlbCBSYXluYWwgPG1pcXVlbC5y
YXluYWxAYm9vdGxpbi5jb20+IHdyb3RlOgo+Cj4gSGkgSmFtZXMsCj4KPiBPbiAxNS8xMS8yMDI2
IGF0IDIzOjI5OjE1IC0wNywgSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxpYXJkMUBnbWFpbC5j
b20+IHdyb3RlOgo+Cj4gPiBBbiBNVEQgaGFuZGxlIGNhbiBvdXRsaXZlIGNvbnRyb2xsZXIgdW5i
aW5kLiBJdHMgbWV0YWRhdGEgYW5kIE5BTkQgbG9ja3MKPiA+IG11c3QgcmVtYWluIHZhbGlkLCBp
bmNsdWRpbmcgd2hlbiBhIHdyaXRhYmxlIGZpbGUgY2xvc2VzIGFuZCBjYWxscyBzeW5jLAo+ID4g
d2hpbGUgZnVydGhlciBoYXJkd2FyZSBhY2Nlc3MgbXVzdCBiZSByZWplY3RlZCBhZnRlciBkaXNj
b25uZWN0aW9uLgo+ID4KPiA+IFRoaXMgYnVpbGRzIG9uIGVhcmxpZXIgTVREIHJlbW92YWwtbGlm
ZXRpbWUgd29yay4gQ29tbWl0IDE5YmZhOWViZWJiNQo+ID4gKCJtdGQ6IHVzZSByZWZjb3VudCB0
byBwcmV2ZW50IGNvcnJ1cHRpb24iKSBhZGRlZCBNVEQgcmVmZXJlbmNlIGNvdW50aW5nCj4gPiBb
MF0sIGJ1dCByZXRhaW5pbmcgYW4gTVREIHJlZmVyZW5jZSBkb2VzIG5vdCBieSBpdHNlbGYgcmV0
YWluIHRoZQo+ID4gZHJpdmVyLW93bmVkIGFsbG9jYXRpb24gY29udGFpbmluZyB0aGUgbWFzdGVy
LiBUaGUgcmVhZC91bmJpbmQgZGlzY3Vzc2lvbgo+ID4gYWxzbyBjb3ZlcmVkIHJhdyBOQU5EIFsx
XSBhbmQgZHJhaW5pbmcgYWN0aXZlIG9wZXJhdGlvbnMgWzJdLiBUemUgWWVlIE5nJ3MKPiA+IFNQ
SS1OT1Igc2VyaWVzIGFkZHJlc3NlcyB0aGUgY29ycmVzcG9uZGluZyBTUEktTk9SIHBhdGhzIFsz
XS4KPiA+Cj4gPiBGb2xsb3dpbmcgR3JlZydzIHJldmlldyBbN10sIHNlcGFyYXRlIGNsYXNzLWRl
dmljZSBkYXRhIGZyb20gdGhlIE1URAo+ID4gYmFja2luZyBhbGxvY2F0aW9uLiBEZWxldGUgdGhl
IGRldmljZSdzIGludGVyZmFjZXMgYW5kIGRyYWluIE5WTUVNIGFuZAo+ID4gY2xhc3MgUE0gY2Fs
bGJhY2tzIGJlZm9yZSByZWxlYXNpbmcgYmFja2luZyBkYXRhLiBCYXJlIGRldmljZSByZWZlcmVu
Y2VzCj4gPiByZXRhaW4gYW4gaW5kZXBlbmRlbnRseSBhbGxvY2F0ZWQgZGV2aWNlLCB3aG9zZSB0
eXBlLCBQTSBkaXNwYXRjaCBhbmQKPiA+IGZpbmFsIHJlbGVhc2UgYXJlIGJ1aWx0IGluIGV2ZW4g
d2hlbiBNVEQgaXMgbW9kdWxhci4gTlZNRU0gc2ltaWxhcmx5Cj4gPiBkaXNjb25uZWN0cyBhbmQg
ZHJhaW5zIHByb3ZpZGVyIGFuZCBsYXlvdXQgY2FsbGJhY2tzIGJlZm9yZSB1bnJlZ2lzdGVyCj4g
PiByZXR1cm5zOyByZXRhaW5lZCBjb25zdW1lcnMga2VlcCBjb3JlLW93bmVkIG1ldGFkYXRhIGFu
ZCByZWNlaXZlIC1FTk9ERVYKPiA+IG9uIHN1YnNlcXVlbnQgYWNjZXNzLgo+ID4KPiA+IEludHJv
ZHVjZSBvcHQtaW4gYmFja2luZy1vYmplY3Qgb3duZXJzaGlwIGZvciBNVEQgbWFzdGVycy4gUmVn
aXN0ZXJlZAo+ID4gbm9kZXMgYW5kIGFjcXVpcmVkIE1URCBoYW5kbGVzIHJldGFpbiB0aGUgY2hp
cCwgd2hpbGUgbmVzdGVkIHBhcnRpdGlvbnMKPiA+IGFsc28gcmV0YWluIHRoZWlyIHBhcmVudCBt
ZXRhZGF0YS4gVW5yZWdpc3RlciBmaXJzdCBzbyByZW1vdmFsIG5vdGlmaWVycwo+ID4gY2FuIGZp
bmlzaCBJL08sIHRoZW4gZGlzY29ubmVjdCByYXcgTkFORCBhbmQgZHJhaW4gYWRtaXR0ZWQgb3Bl
cmF0aW9ucy4KPiA+IEhhcmR3YXJlIHJlc291cmNlcyBjYW4gYmUgcmVsZWFzZWQgd2l0aG91dCB3
YWl0aW5nIGZvciBvcGVuIGZpbGVzIHRvIGNsb3NlLgo+ID4KPiA+IFZpcnR1YWwgY29uY2F0ZW5h
dGlvbnMgc2VyaWFsaXplIHB1YmxpY2F0aW9uIGFuZCByZW1vdmFsIGFjcm9zcyBwaHlzaWNhbAo+
ID4gY29udHJvbGxlcnMuIERpc2Nvbm5lY3QgYW5kIGRyYWluIGEgcHVibGlzaGVkIGNvbmNhdGVu
YXRpb24gYmVmb3JlIGFueQo+ID4gY29tcG9uZW50IGNhbiBkaXNhcHBlYXIsIHRoZW4gcmVsZWFz
ZSBpdHMgY29tcG9uZW50IHJlZmVyZW5jZXMuIEFuIG9sZAo+ID4gaGFuZGxlIGtlZXBzIHRoZSBk
aXNjb25uZWN0ZWQgdmlydHVhbCBkZXZpY2UsIGluZGVwZW5kZW50bHkgb2YgYSBsYXRlcgo+ID4g
cmVwbGFjZW1lbnQuCj4gPgo+ID4gUnVuIE5BTkQgYW5kIGNvbnRyb2xsZXItc3BlY2lmaWMgY2xl
YW51cCBkdXJpbmcgZGlzY29ubmVjdGlvbiwgd2hpbGUKPiA+IHRoZSBjb250cm9sbGVyIGRyaXZl
ciBpcyBzdGlsbCBib3VuZC4gU25hcHNob3QgdGhlIE9PQiBsYXlvdXQgaW4gY29yZS1vd25lZAo+
ID4gZGF0YSBiZWZvcmUgcHVibGljYXRpb24gc28gbWV0YWRhdGEgcXVlcmllcyByZW1haW4gdmFs
aWQgd2l0aG91dCBkcml2ZXIKPiA+IGNhbGxiYWNrcy4gVGhlIE5BTkQgY29yZSBmcmVlcyByZXRh
aW5lZCBjaGlwIGFuZCBjb250cm9sbGVyIGFsbG9jYXRpb25zOwo+ID4gdGhlIGZpbmFsIE1URCBw
dXQgbmV2ZXIgY2FsbHMgYmFjayBpbnRvIHRoZSBjb250cm9sbGVyIG1vZHVsZS4gT3JkaW5hcnkK
PiA+IE1URCBhbmQgTlZNRU0gaGFuZGxlcyByZXRhaW4gdGhlIE5BTkQgY29yZSB0aGF0IGltcGxl
bWVudHMgdGhlaXIKPiA+IG9wZXJhdGlvbnMsIHJhdGhlciB0aGFuIHRoZSBoYXJkd2FyZSBkcml2
ZXIuCj4gPgo+ID4gU2hhcmUgYWxsb2NhdGlvbiBvd25lcnNoaXAgYWNyb3NzIHRoZSByYXctTkFO
RCBkcml2ZXJzLCBpbmNsdWRpbmcKPiA+IHBhcnRpYWxseSBwdWJsaXNoZWQgcHJvYmVzLiBTaGFy
ZWQgY29udHJvbGxlcnMgcmVtYWluIGFsbG9jYXRlZCB1bnRpbAo+ID4gdGhlaXIgbGFzdCByZXRh
aW5lZCBjaGlwIGlzIHJlbGVhc2VkLiBSODUyIGFsbG9jYXRlcyBhIG5ldyBjaGlwIGZvciBlYWNo
Cj4gPiBjYXJkLCBhbmQgTkRGQyBhbGxvY2F0ZXMgY29udHJvbGxlciBzdGF0ZSBwZXIgYmluZGlu
Zy4KPiA+Cj4gPiBCYXNlZCBvbiBOQU5EIG5leHQgYXQgMzBkYWFmM2U3ODk3LCB3aXRoIFR6ZSBZ
ZWUgTmcncyBtb2R1bGUtcmVmZXJlbmNlCj4gPiBvcmRlcmluZyBmaXggWzRdLCBLYXJsIE1laGx0
cmV0dGVyJ3MgT1RQIGNsZWFudXAgZml4IFs2XSwgYW5kIHRoZSBzZXBhcmF0ZWx5Cj4gPiBwb3N0
ZWQgcmVnaXN0cmF0aW9uLCBvcGVyYXRpb24tbG9ja2luZyBhbmQgY29udHJvbGxlciBwcm9iZS90
ZWFyZG93biBmaXhlcwo+ID4gaWRlbnRpZmllZCBieSB0aGUgcHJlcmVxdWlzaXRlIG1ldGFkYXRh
LiBUTEErIG1vZGVscyBhbmQgdGhlaXIgYXNzdW1wdGlvbnMKPiA+IGFuZCBjb3ZlcmFnZSBsaW1p
dHMgYXJlIGF2YWlsYWJsZSBpbiBbNV0uCj4KPiBXaGlsZSBsaWZldGltZSBpc3N1ZXMgYXJlIGEg
cmVhbCBjb25jZXJuIGluIHRoZSBrZXJuZWwsIHBsZWFzZSBub3RlIHRoYXQKPiBpbiBnZW5lcmFs
LCByZW1vdmluZyBvciB1bmJpbmRpbmcgdGhlIGZsYXNoIGNvbnRyb2xsZXIgZHJpdmVyIGlzIG5v
dCBhCj4gcHJhY3RpY2FsIG9wZXJhdGlvbi4gV2hpbGUgaGlnaGx5IHVubGlrZWx5LCB0aGlzIGlz
IHBvc3NpYmxlIHRob3VnaC4gQnV0Cj4gSSBhbSBub3QgZ29pbmcgdG8gc2FjcmlmaWNlIGFsbCB0
aGUgZGV2bV8gY2FsbHMgaW4gZmF2b3Igb2YgcmVpbnN0YXRpbmcKPiBtYW51YWwgZXJyb3IgaGFu
ZGxpbmcganVzdCBmb3IgdGhhdC4gSWYgdGhlcmUgaXMgYSB3YXksIGl0IG11c3QgYmUKPiBkaWZm
ZXJlbnQuCgpVbmJpbmQgaXMgdW51c3VhbCBmb3IgZml4ZWQgZmxhc2gsIGFsdGhvdWdoIHRoZXJl
IHdhcyBhIHJlcG9ydCBvZiBhCkRlbmFsaSByZWFkIHJhY2luZyB3aXRoIHVuYmluZCBbMF0uIFdp
dGggcmVtb3ZhYmxlIG1lZGlhLCB0aGlzIGNhbgpoYXBwZW4gZHVyaW5nIG5vcm1hbCB1c2U6IHI4
NTIgdW5yZWdpc3RlcnMgdGhlIE1URCBkZXZpY2Ugd2hlbiB0aGUgY2FyZAppcyBlamVjdGVkLCB3
aGlsZSB0aGUgUENJIGRyaXZlciBzdGF5cyBib3VuZC4gSXQgc2hvdWxkIGJlIHBvc3NpYmxlIHRv
CmhhbmRsZSBib3RoIGNhc2VzIHdpdGhvdXQgZ2l2aW5nIHVwIG1hbmFnZWQgcHJvYmUgY2xlYW51
cC4KCj4gQWxzbywgdGhpcyBraW5kIG9mIGNvbnRyaWJ1dGlvbiBjYW4gb25seSBiZSBkb25lIGlm
IHlvdSAqdW5kZXJzdGFuZCoKPiB3aGF0IHlvdSBhcmUgZG9pbmcuIEdldHRpbmcgdGhlIGJpZyBw
aWN0dXJlIGhlcmUgaXMgbm90IG9wdGlvbmFsLgoKQ29uc2lkZXIgYSB3cml0YWJsZSAvZGV2L210
ZFggZmlsZSB0aGF0J3MgaWRsZSB3aGVuIHRoZSBjYXJkIGlzCmVqZWN0ZWQuIFRoZXJlJ3Mgbm8g
SS9PIHRvIGRyYWluIGZyb20gdGhhdCBmaWxlLCBidXQgY2xvc2luZyBpdCBsYXRlcgpzdGlsbCBj
YWxscyBtdGRfc3luYygpLiBUaGF0IGNsb3NlIG11c3Qgbm90IHRvdWNoIHRoZSBvbGQgY2FyZCBv
ciBhIG5ldwpvbmUgaW5zZXJ0ZWQgaW4gaXRzIHBsYWNlLiBSZW1vdmFsIG5lZWRzIHRvIHdhaXQg
Zm9yIEkvTyBhbHJlYWR5IHVzaW5nCnRoZSBkZXZpY2UgdG8gZmluaXNoIG9yIGJlIGFib3J0ZWQs
IG5vdCBmb3IgdXNlcnNwYWNlIHRvIGNsb3NlIHRoZSBmaWxlLgoKPiBNYXliZSB0aGUgcHJvYmxl
bSBpcyBNVEQgcmVmY291bnRpbmc/IE1heWJlIHRoZSBwcm9ibGVtIGlzIHRoZSBkZXZtXwo+IG9y
ZGVyZ2luZz8gSSBkb24ndCBrbm93LCBJIGhhdmVuJ3QgbG9va2VkIGluIGRlcHRoIGF0IGFsbCB0
aGUKPiBwYXRjaGVzLiBCdXQgdGhlIGN1cnJlbnQgYXBwcm9hY2ggaXMgY2xlYXJseSBub3QgYWNj
ZXB0YWJsZS4KClRoZSBpc3N1ZSBpcyB3aGF0IHRoZSBNVEQgcmVmZXJlbmNlIG93bnMuIFRoZSBj
aGFuZ2UgaW4gWzFdIGRlZmVycyBNVEQKY29yZSBjbGVhbnVwIHVudGlsIHRoZSBsYXN0IHJlZmVy
ZW5jZSBpcyBkcm9wcGVkLiBJbiByYXcgTkFORCwgdGhvdWdoLAp0aGUgbXRkX2luZm8gaXMgZW1i
ZWRkZWQgaW4gdGhlIG5hbmRfY2hpcC4gQW4gTVREIHJlZmVyZW5jZSBkb2Vzbid0CmtlZXAgdGhl
IGRyaXZlcidzIGFsbG9jYXRpb24gY29udGFpbmluZyB0aGF0IGNoaXAgYWxpdmUuIFJlb3JkZXJp
bmcKZGV2cmVzIGNsZWFudXAgY2FuJ3QgcHJvdGVjdCBhIGNsb3NlIHRoYXQgaGFwcGVucyBhZnRl
ciBkZXRhY2guCgpPbmUgd2F5IHRvIGtlZXAgdGhlIGZpeCBpbiB0aGUgY29yZSB3b3VsZCBiZSB0
byBnaXZlIGNvbnN1bWVycyBhbiBNVEQKb2JqZWN0IHdob3NlIHN0b3JhZ2UgaXMgc2VwYXJhdGUg
ZnJvbSB0aGUgY2hpcC4gQXQgdW5yZWdpc3RlciwgdGhlIGNvcmUKY291bGQgZGlzY29ubmVjdCB0
aGF0IG9iamVjdCBmcm9tIHRoZSBkcml2ZXIgYW5kIGRyYWluIG9wZXJhdGlvbnMgdGhhdAphbHJl
YWR5IGhhdmUgYWNjZXNzIHRvIGl0LCBtdWNoIGxpa2UgTlZNRU0gZG9lcyBmb3IgcHJvdmlkZXIg
b3BlcmF0aW9ucwpbMl0uIFRoZSBkcml2ZXIgY291bGQgdGhlbiBmcmVlIGl0cyBwcml2YXRlIHN0
YXRlLiBSZWFkcyBhbmQgd3JpdGVzIG9uCnRoZSBvbGQgZmlsZSB3b3VsZCByZXR1cm4gLUVOT0RF
ViwgYW5kIGNsb3NlIHdvdWxkIGRyb3AgdGhlIHJlZmVyZW5jZQp3aXRob3V0IGNhbGxpbmcgdGhl
IGRyaXZlci4gVGhlIG1haW4gY2hhbmdlIGZvciByYXcgTkFORCBpcyB0aGF0IGl0CmNvdWxkIG5v
IGxvbmdlciByZWNvdmVyIHRoZSBjaGlwIGZyb20gdGhlIGNvbnN1bWVyJ3MgbXRkX2luZm8gYnkK
YXNzdW1pbmcgb25lIGlzIGVtYmVkZGVkIGluIHRoZSBvdGhlci4KClRoZSBvdGhlciB3YXkgdG8g
ZnJlZSB0aGUgY2hpcCBhdCByZW1vdmFsIGlzIHRvIGtlZXAgdGhlIGN1cnJlbnQgbGF5b3V0CmFu
ZCBoYXZlIGV2ZXJ5IGNvbnN1bWVyIGRyb3AgaXRzIE1URCBwb2ludGVyIGF0IHVucmVnaXN0ZXIu
IFRoYXQgY291bGQKd29yayBmb3IgbXRkY2hhciwgYnV0IGl0IHdvdWxkIGFsc28gaGF2ZSB0byBj
b3ZlciBpbi1rZXJuZWwgY29uc3VtZXJzCnN1Y2ggYXMgVUJJLiBGaXhpbmcgdGhlIGNsb3NlIHBh
dGggYWxvbmUgd291bGRuJ3QgYmUgZW5vdWdoLgoKQSBzaGFyZWQgYWxsb2NhdGlvbiBoZWxwZXIg
b3IgYSBwZXItcHJvdmlkZXIgcmVmZXJlbmNlLCBhcyBwcm9wb3NlZCBmb3IKU1BJIE5PUiBbM10s
IHdvdWxkIGtlZXAgdGhlIGFsbG9jYXRpb24gdW50aWwgdGhlIGxhc3QgcHV0LiBUaGF0J3Mgbm90
IGEKcGVybWFuZW50IGxlYWssIGJ1dCBhbiBpZGxlIGZpbGUgY291bGQgc3RpbGwgcGluIGRyaXZl
ci1wcml2YXRlIG1lbW9yeQppbmRlZmluaXRlbHkuIFdhaXRpbmcgZm9yIHRoZSBsYXN0IHB1dCBk
dXJpbmcgcmVtb3ZhbCB3b3VsZCBpbnN0ZWFkIGxldAp0aGUgc2FtZSBmaWxlIGJsb2NrIHJlbW92
YWwgaW5kZWZpbml0ZWx5LgoKV291bGQgaXQgbWFrZSBzZW5zZSB0byBwdXJzdWUgdGhlIGNvcmUt
b3duZWQgTVREIG9iamVjdCwgc28gYW4gb3BlbgpmaWxlIGNhbiBzdXJ2aXZlIHJlbW92YWwgd2l0
aG91dCBrZWVwaW5nIGFueSBkcml2ZXItcHJpdmF0ZSBtZW1vcnkKYWxpdmU/CgpbMF0gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvci9DQU5ENEg3ZHo5NEdzaV90WFNRbUxObWU5dVJPbm91T1V3dUNY
OUJXXytSQ2MyWkZEcUFAbWFpbC5nbWFpbC5jb20vClsxXSBodHRwczovL2xvcmUua2VybmVsLm9y
Zy9yLzIwMjMwNjIwMTMxOTA1LjY0ODA4OS0yLWFsZXhhbmRlci51c3lza2luQGludGVsLmNvbS8K
WzJdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNjEwMDIxMDEzNTIuMTA4NDQ0Ny0xMC1z
cmluaUBrZXJuZWwub3JnLwpbM10gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI2MTAyMjAz
NTM1Mi41MjEyOS0xLXR6ZS55ZWUubmdAYWx0ZXJhLmNvbS8KCj4gVGhhbmtzLAo+IE1JcXXDqGwK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LWFt
bG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWFtbG9naWMK
