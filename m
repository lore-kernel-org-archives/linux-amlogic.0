Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D52CC6B1D
	for <linux-amlogic@archiver.kernel.org>; Wed, 14 Oct 2026 09:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=elua9jMmA2JKGj3k683OpsVRplx7gXJwZ7luaYoEQs4=; b=hjUwJ4XqZSuZDB
	l+wMn3yfeBzdMS+KI0RYorD91t1DyigCBnMDtxBz06QUP3yI9hx7ZpG7WitVq0J/QN97D5sDBPg/F
	Aak6kaSh38rSZ0opqcdOOhxHtX39i6Q+uJhbfNQvpmwnFaaXfGxyhnmaiMj76J4MrBAZQ/Os5zCjq
	pcl9eT0KxOFFGppMCLMX/1OcjEUOKJ8kau4lFSQMZTdwTXbOVUc5SB59Iu4BkKHqIe9OIgy533fHs
	MaGTzW2xUw+HrBl7QuwjZ8PZRdkok1NZM1i9uUctF39v1O6biuHPRfbYaCp2UPtEhF1hPEKYEdMyE
	zmK0RlwIV8SlbSVK9t6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGvJB-0000000F2Dx-3wli;
	Wed, 14 Oct 2026 09:30:01 +0000
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGvJ8-0000000F2Ca-1a9c
	for linux-amlogic@lists.infradead.org;
	Wed, 14 Oct 2026 09:30:01 +0000
Received: by mail-yx1-xb12c.google.com with SMTP id 956f58d0204a3-6798c43a3d6so302955d50.1
        for <linux-amlogic@lists.infradead.org>; Wed, 14 Oct 2026 02:29:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791970197; cv=none;
        d=google.com; s=arc-20260327;
        b=RCty7t3i9nVfT1jfm34YfYehtq3u/zkSs71sVikrqJNl7JihQw0s56hyblO/NbCcwH
         O/gEWx5y5+555MI7ACMuWoMBfHsZod+u43HZlQSXlmpV+7iFXcRbaWdwwBwc1OuhhuAm
         fa0DPuSjzZE0l/xwEdFLvZnqTwXjQslE9jKEvfwNErT9KNFM6ifWkXuVo8vGLwEGg7wb
         eXMRC2rSfIGO2PJ9GAhtxE71UqAPARebCHsYmQPpzGGP41NyA615FJcyXSBMErotsI63
         Fj3Brxh6kJn6DNy/DCOZ9PsI17zHLCgNnuBjla0f0hN+Yx5gKBo5Z0m43j380tI76/l5
         ZsKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pMwu/+dLKz/hELXQ8G9suR4fEQW92masMZdt6u+igOk=;
        fh=yYGzcUd3A4EghDi/1hlQ4QhDRFM+DfWrJvyFfXL8Md4=;
        b=srwcQMNyFlXAI7zMRX54cMV7p+VvSZ1128mZLb3hb8873qIInq/2Mbfu8VLQlQXI26
         U4Lj7R3vRxdOCVolCrg02E5wx9/Q0oYyqXOAzalV5pvtS8tZYTb3FzZFqo2L9iFORNK6
         2pd8w6wQv6DksoCK2SQjK3poJV5k//sTOXQ1inDZuFiJ4gajGhrmNlmeNxYyJZ/OYFvz
         AnyeGNtV46B4E0TC/W+ZpKOY3285YoWco+GeRdabXihrYeLcEOz6HnLwx+O/nhBgNdel
         BjcymQeiC6pKNHX15G375tWW7CIOZfWkzd+8nZccMKI5qI6MfBNG/W+q3XkmfSwXbsVB
         Xpkg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1791970197; x=1792574997; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pMwu/+dLKz/hELXQ8G9suR4fEQW92masMZdt6u+igOk=;
        b=BauyZDJQiex3D2egMv8EtfCNE63DHZEM/hLAR7pUOS6MSP7mhsHEBxEVouuAhVQ1Sw
         aQRP5otfRdOLTO8cM+ND+ZMb3hUZi9QmYgaodsFUujqw2K3khUr7QJ+8r9VPZxw4a7Bx
         5eyI/LKCydXmeaDityX7pughq88FXoZOydEWA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791970197; x=1792574997;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pMwu/+dLKz/hELXQ8G9suR4fEQW92masMZdt6u+igOk=;
        b=1e50nihy5xMxJeTLl16gy8ux5d2UlkeG8rmDv/aUp7eP3zHn6e/eD6kvGr5SQy3FVw
         ALKvLXl6alTtMIts8MBEWmUF7dP2T2pramUbCd6qZCTwxNlAwOjhRp5G4pLnC0jGjKK6
         6QYkAZvYxOZtoH/WfGK5Yt3t/uz/8aGEi5D1wSxjQV2c9gIB35XhXEBXcZVBs/pbq4+c
         zht7Vf3Y8w2Gyx3sVcg2h5RKMVHm5k7XPiL3WFruFPQLqAPXACa2OdgRrK68WhFk0OgB
         zB+wAj7TT8bRWtu1bCxJe/4NZ2yMjZ0MhXDvAY67RNeVPARST4f2bn+cTDF2l7+IPQrk
         14cA==
X-Forwarded-Encrypted: i=1; AKwUvBwS2X5wLS/9uveznpkaFbU7vPufQ8aRr+ad0kP9dGiLyu3rLRF0LXRyZGIP4FPF2obxUzB/J1fj66upyTxQ@lists.infradead.org
X-Gm-Message-State: AFq9FYJ6uXfS2FeZex/MKdKYZtaBPm0uzXZZ4BlJXb1SMsDncszRqx4i
	Lcz5FBaX89/zh5+VN+/I8jEyqwxVzpieHOe7ueggIucYGZtdiE+4PIiLhw+qcxR2jIH5jb55N6k
	ddEXrW7w1xKwekaAMIjbKFbHbbP+De3AnWaNTm0XA
X-Gm-Gg: AYBFou0YVe1NGqHi9homHBgt4V6WuWYVTKxzt/uD1YC1RKiJN2J3HKWWrL20/BHQ1Sp
	NaLvsx57qFFq/tN1/1n+MK+Ba9DfO1OZhdu1peVhjNsCtM0aGhZvBkif1y6137QnHoh7KWziAta
	RTTDnLWGS1xwWaaJGlOeOXYJgrZrIbR5htBKp0ts0dpxkN9CNPHD/so5ErsVYjuF0cepJc6d5Ds
	5WRZhegOWgjPff91lAGlQ+FKkg/ORAdWy8v8slQk5UoCIAl2QEFPnscXxhK1lpp23Ke504ACiUj
	gHiEwU+nKCjQjyRRZWPWeF4IN+868HdMb1UEQ2iIzjxhKDgrXEllO1oKzxpMtJPJm1Y=
X-Received: by 2002:a05:690e:1094:10b0:677:d106:6f97 with SMTP id
 956f58d0204a3-679363475c0mr3180487d50.152.1791970197053; Wed, 14 Oct 2026
 02:29:57 -0700 (PDT)
MIME-Version: 1.0
References: <20261014082037.1774672-1-wenst@chromium.org> <20261014082037.1774672-3-wenst@chromium.org>
 <7020a7a6-332e-4fd0-a659-d82eb768614c@linaro.org>
In-Reply-To: <7020a7a6-332e-4fd0-a659-d82eb768614c@linaro.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 14 Oct 2026 18:29:46 +0900
X-Gm-Features: AclHuK9N2qPZVqRIKj3AC2e-RNgLBJ_oiV-FNmg6s8RgvBJGg_msVeXPasEPdno
Message-ID: <CAGXv+5G1kgyumbj7wGf6rPFbg3spSO0zYmEkn-hZT4qUdJbytA@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: usb: snps,dwc3: Fix downstream port numbering
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <balbi@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Sven Peter <sven@kernel.org>, 
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Ryan Chen <ryan_chen@aspeedtech.com>, 
	Billy Tsai <billy_tsai@aspeedtech.com>, Michal Simek <michal.simek@amd.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, Minda Chen <minda.chen@starfivetech.com>, 
	Shyam Pandey <radhey.shyam.pandey@amd.com>, Wei Yang <yangwei1@eswincomputing.com>, 
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>, Hang Cao <caohang@eswincomputing.com>, 
	Li Jun <jun.li@nxp.com>, Peng Fan <peng.fan@nxp.com>, Roy Luo <royluo@google.com>, 
	Yang Xiwen <forbidden405@foxmail.com>, 
	Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>, 
	Robert Marko <robert.marko@sartura.hr>, Xu Yang <xu.yang_2@nxp.com>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Stanley Chang <stanley_chang@realtek.com>, 
	Ze Huang <huang.ze@linux.dev>, Aswath Govindraju <a-govindraju@ti.com>, 
	Roger Quadros <rogerq@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev, linux-aspeed@lists.ozlabs.org, imx@lists.linux.dev, 
	linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_022958_493342_FD31F2D4 
X-CRM114-Status: GOOD (  34.39  )
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

T24gV2VkLCBPY3QgMTQsIDIwMjYgYXQgNToyOOKAr1BNIE5laWwgQXJtc3Ryb25nCjxuZWlsLmFy
bXN0cm9uZ0BsaW5hcm8ub3JnPiB3cm90ZToKPgo+IE9uIDEwLzE0LzI2IDEwOjIwLCBDaGVuLVl1
IFRzYWkgd3JvdGU6Cj4gPiBUaGUgRFdDMyBjb250cm9sbGVyIGNhbiBvcGVyYXRlIGluIGhvc3Qg
bW9kZS4gSXQgZG9lcyBzbyB3aXRoIGEgWEhDSQo+ID4gY29tcGxpYW50IGhvc3QgY29udHJvbGxl
ci4gVGhlIFhIQ0kgaGFzIHR3byBkb3duc3RyZWFtIHBvcnRzLCBvbmUgZm9yCj4gPiBIUyBhbmQg
b25lIGZvciBTUy4gVVNCIGRvd25zdHJlYW0gcG9ydHMgc3RhcnQgZnJvbSAxLCBub3QgMC4KPgo+
IElzIHRoZXJlIHNvbWV0aGluZyBpbiBpbmRleCAwIHdlIHdpbGwgbmVlZCB0byBkZWZpbmUgYXQg
c29tZSBwb2ludCA/CgpPbiB0aGUgaG9zdCBzaWRlLCBuby4gRG93bnN0cmVhbSBwb3J0cyBzdGFy
dCBhdCAxLgoKT24gdGhlIGRldmljZSBtb2RlIHNpZGUsIEkgYmVsaWV2ZSB0aGUgbnVtYmVycyBh
cmUgY29tcGxldGVseSBtYWRlIHVwLgoKPiBVc2luZyAwIGFzIGJhc2UgZm9yIG51bWJlcmluZyBp
biBEVCBpc24ndCBpbmNvbXBhdGlibGUgd2l0aCB0aGUgVVNCCj4gc3BlYyB1c2luZyBiYXNlIDEg
Zm9yIG51bWJlcmluZywKCkJ1dCB5b3UgZW5kIHVwIHdpdGggZGl2ZXJnaW5nIG51bWJlcmluZyBz
Y2hlbWVzLCBhbmQgaXQgZGl2ZXJnZXMKZnJvbSBvdGhlciBVU0IgY29udHJvbGxlcnMsIHBhcnRp
Y3VsYXJseSBYSENJLCB3aGljaCBEV0MzIGVtYmVkcy4KCkFuZCBpdCBhbHNvIGRpZmZlcnMgZnJv
bSB0aGUgbnVtYmVyaW5nIGN1cnJlbnRseSB1c2VkIGZvciBkaXJlY3RseQpjb25uZWN0ZWQgb25i
b2FyZCBkZXZpY2VzIChsaWtlIGh1YnMpLCB3aGljaCB1c2Ugb3IgZXhwZWN0IHRoZSBVU0IKbnVt
YmVyaW5nIHNjaGVtZS4KClN1cmUgd2UgY2FuIG1ha2UgRFdDMyAic3BlY2lhbCIsIGRyb3AgaW5j
bHVzaW9uIG9mIHVzYi1oY2QueWFtbCwKYW5kIGR1cGxpY2F0ZSB0aGUgc2VjdGlvbiBmb3Igb25i
b2FyZCBkZXZpY2VzLiBPbiBMaW51eCwgd2UgY2FuCmFkZCBzb21lIG1vcmUgY29kZSB0byB4aGNp
X2ZpbmRfcmF3X3BvcnRfbnVtYmVyKCkgdG8gbWFrZSBhbgpleGNlcHRpb24gZm9yIERXQzMgY29u
dHJvbGxlcnMuCgpBbHNvLCB1c2Jfb2ZfZ2V0X2Nvbm5lY3RfdHlwZSgpIGlzIGFscmVhZHkgYnJv
a2VuIGZvciBEV0MzIGJhc2VkCmNvbnRyb2xsZXJzIHRoYXQgb25seSBkZXNjcmliZSB0aGUgSFMg
Y29ubmVjdGlvbiBidXQgbm90IHRoZSBTUwpjb25uZWN0aW9uLiB1c2Jfb2ZfZ2V0X2Nvbm5lY3Rf
dHlwZSgpIGN1cnJlbnRseSBkb2Vzbid0IGNhbGwKdXNiX2hjZF9maW5kX3Jhd19wb3J0X251bWJl
cigpIHNvIGJvdGggSFMgYW5kIFNTIGdldCBtYXBwZWQgdG8gcG9ydCAxLAp3aGljaCB3b3VsZG4n
dCBiZSBpbiB0aGUgRFQgc2luY2UgSFMgaXMgY3VycmVudGx5IHBvcnRAMC4gQnV0IGV2ZW4gaWYK
aXQgZGlkLCBTUyB3b3VsZCBnZXQgbWFwcGVkIHRvIHBvcnQgMiBhbnl3YXkuCgoKSU1ITyBoYXZp
bmcgY29uc2lzdGVudCBudW1iZXJpbmcgYWNyb3NzIGNvbnRyb2xsZXIgdHlwZXMgd291bGQgYmUK
YmV0dGVyLiBUaGlzIGF2b2lkcyBtYWtpbmcgdGhlIFVTQiBjb3JlIGFuZCBodWIgY29kZSBkZWFs
IHdpdGggbW9yZQpleGNlcHRpb25zLCBhbmQgYWxzbyBlYXNpZXIgdG8gdW5kZXJzdGFuZCBhbmQg
d3JpdGUgZGV2aWNlIHRyZWVzLgoKPiA+IFJlY29uY2lsZSB0aGUgZG93bnN0cmVhbSBwb3J0IG51
bWJlcmluZyB3aXRoIHRoZSBjb21tb24gVVNCIGhvc3QKPiA+IGJpbmRpbmcsIHJlbnVtYmVyaW5n
IHRoZSBkb3duc3RyZWFtIHBvcnQgbnVtYmVycyBmcm9tIDAgYW5kIDEgdG8KPiA+IDEgYW5kIDIu
Cj4gPgo+ID4gVGhpcyBpcyBub24tYmFja3dhcmRzIGNvbXBhdGlibGUsIGhvd2V2ZXIgaXQgd29u
J3QgYnJlYWsgY3VycmVudAo+ID4gbWFqb3IgaW1wbGVtZW50YXRpb25zOgo+ID4KPiA+IC0gZHdj
MyAiZ2FkZ2V0IG1vZGUiIGluIExpbnV4IGtlcm5lbCBvbmx5IHJlcXVpcmVzIGEgY29ubmVjdGlv
biB0byBiZQo+ID4gICAgcHJlc2VudDsgaXQgZG9lc24ndCBtYXR0ZXIgd2hpY2ggcG9ydCBpdCBp
cwo+ID4gICAgLSBkd2MzICJob3N0IG1vZGUiIE9GIGdyYXBoIGNvbm5lY3Rpb25zIGFyZW4ndCBz
dXBwb3J0ZWQgeWV0IFsxXQo+ID4gLSBGcmVlQlNEIGRvZXNuJ3QgdXNlIHRoZSBPRiBncmFwaCBm
b3IgYW55dGhpbmcKPiA+IC0gVS1ib290IGRvZXNuJ3QgdXNlIHRoZSBPRiBncmFwaCBmb3IgVVNC
Cj4gPiAtIE9wZW5CU0QgZG9lc24ndCBzdXBwb3J0IGR3YzMsIG9ubHkgdGhlIFhIQ0kgaW4gZHdj
MywgYW5kIGRvZXNuJ3QgdXNlCj4gPiAgICB0aGUgT0YgZ3JhcGggZm9yIFVTQgo+ID4gLSBjb3Jl
Ym9vdCBkb2Vzbid0IHVzZSB0aGUgT0YgZ3JhcGggZm9yIGFueXRoaW5nCj4gPiAtIFplcGh5ciBk
b2Vzbid0IHN1cHBvcnQgZHdjMwo+ID4gLSBURi1BIGRvZXNuJ3QgdXNlIHRoZSBPRiBncmFwaCBm
b3IgYW55dGhpbmcKPiA+IC0gRURLMiBkb2Vzbid0IHN1cHBvcnQgZHdjMyBhbmQgZG9lc24ndCBz
dXBwb3J0IE9GIGdyYXBoCj4gPiAtIE9QLVRFRSBkb2Vzbid0IHN1cHBvcnQgZHdjMyBhbmQgZG9l
c24ndCBzdXBwb3J0IE9GIGdyYXBoCj4gPgo+ID4gWzFdIFdJUCB0byB0aWUgT0YgZ3JhcGggcG9y
dCBub2RlIHRvIFVTQiBwb3J0IGRldmljZQo+ID4KPiA+IEZpeGVzOiBhMzMxMTNmNzM2OTMgKCJk
dC1iaW5kaW5nczogdXNiOiBzbnBzLGR3YzM6IGRvY3VtZW50IEhTICYgU1MgT0YgZ3JhcGggcG9y
dHMiKQo+ID4gU2lnbmVkLW9mZi1ieTogQ2hlbi1ZdSBUc2FpIDx3ZW5zdEBjaHJvbWl1bS5vcmc+
Cj4gPiAtLS0KPiA+IEl0IGlzIHVuY2xlYXIgdG8gbWUgd2hldGhlciB0aGUgSFMvU1MgbnVtYmVy
aW5nIGlzIGZpeGVkIGZvciBhbGwgZHdjMwo+ID4gdmFyaWFudHMuIEkgY2hlY2tlZCBBbGx3aW5u
ZXIgSDYxNiBhbmQgUm9ja2NoaXAgUkszNTg4IGFuZCB0aGV5IGJvdGgKPiA+IGhhdmUgSFMgYXMg
cG9ydCAxIGFuZCBTUyBhcyBwb3J0IDIuCj4gPgo+ID4gVGhpcyBhbHNvIGRvZXNuJ3QgY292ZXIg
YSBwb3RlbnRpYWwgIm11bHRpLXBvcnQiIERXQzMgaW1wbGVtZW50YXRpb24sCj4gPiB3aGljaCBR
dWFsY29tbSBzZWVtcyB0byBoYXZlLgo+Cj4gSXQgYnJlYWtzIHRoZSBjdXJyZW50IFF1YWxjb21t
IG51bWJlcmluZyBvbiBudW1lcm91cyBib2FyZHMuCgpZZXMuIEl0IGJyZWFrcyBfZXZlcnlvbmVf
IHVzaW5nIHRoZSBjdXJyZW50IG51bWJlcmluZyBpbiB0aGUgc2Vuc2UgdGhhdAp0aGV5IGFyZSBu
byBsb25nZXIgdmFsaWQsIGJ1dCBzaG91bGQgbm90IGFmZmVjdCBhY3R1YWwgdXNhZ2UuCgpUaGlz
IGNvbW1lbnQgcmVmZXJzIHRvICJtdWx0aXBvcnQiIGNvbnRyb2xsZXJzIGZyb20gUXVhbGNvbW0g
WzFdLCB3aGljaAp3b3VsZCBoYXZlIHBvcnRzIGJleW9uZCAxIGFuZCAyLgoKWzFdIGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL2FsbC8yMDI0MDQyMDA0NDkwMS44ODQwOTgtOC1xdWljX2tyaXNrdXJh
QHF1aWNpbmMuY29tLwoKCj4gPiAtLS0KPiA+ICAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL3VzYi9zbnBzLGR3YzMtY29tbW9uLnlhbWwgfCA0ICsrLS0KPiA+ICAgMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0
IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9zbnBzLGR3YzMtY29tbW9u
LnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL3NucHMsZHdjMy1j
b21tb24ueWFtbAo+ID4gaW5kZXggNmMwYjhiNjUzODI0Li40YjYzMDRiZDJlYzEgMTAwNjQ0Cj4g
PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdXNiL3NucHMsZHdjMy1j
b21tb24ueWFtbAo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Vz
Yi9zbnBzLGR3YzMtY29tbW9uLnlhbWwKPiA+IEBAIC00MTAsMTEgKzQxMCwxMSBAQCBwcm9wZXJ0
aWVzOgo+ID4gICAgICAgICBwcm9wZXJ0eSBpcyB1c2VkLgo+ID4KPiA+ICAgICAgIHByb3BlcnRp
ZXM6Cj4gPiAtICAgICAgcG9ydEAwOgo+ID4gKyAgICAgIHBvcnRAMToKPiA+ICAgICAgICAgICAk
cmVmOiAvc2NoZW1hcy9ncmFwaC55YW1sIy9wcm9wZXJ0aWVzL3BvcnQKPiA+ICAgICAgICAgICBk
ZXNjcmlwdGlvbjogSGlnaCBTcGVlZCAoSFMpIGRhdGEgYnVzLgo+ID4KPiA+IC0gICAgICBwb3J0
QDE6Cj4gPiArICAgICAgcG9ydEAyOgo+ID4gICAgICAgICAgICRyZWY6IC9zY2hlbWFzL2dyYXBo
LnlhbWwjL3Byb3BlcnRpZXMvcG9ydAo+ID4gICAgICAgICAgIGRlc2NyaXB0aW9uOiBTdXBlciBT
cGVlZCAoU1MpIGRhdGEgYnVzLgo+ID4KPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dp
Y0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtYW1sb2dpYwo=
