Return-Path: <SRS0=DVbv=PT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AA6CC43387
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Jan 2019 16:50:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C20E20657
	for <linux-amlogic@archiver.kernel.org>; Fri, 11 Jan 2019 16:50:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gv3v6a71"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C20E20657
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fG34pUAft6v1GMPcBaThnDZ9zy9YicEvlEccvHVvB20=; b=gv3v6a71WcP0EY
	Rt0v4KUUwtnc451rA8Nf+90K0SQYKIQoAeUyUCnC6gZe/uW15lHiRySaJKe6oYdSLJgqQgTNY7BGT
	k2pAJoB1WhHlfc2sK3ZltCjRSBoKfY5tgvPFu7T7UMc+aEOVd/7q/gLuJ4XiZVXlh2OlOv+NCE1tB
	JpQkCSJD4O1Hw0R6YHKI2Zna+x99eVv7tWeFxZPOp9sRPBxfSl2o8i7aCgiBVaPND5Ajp6QP4HEd9
	yEok3JXI/JW4PkJIaghXCK7UMwu77Z/I1ufx9YoJng/FzmCpZM+ASeP8PP7w2o2U+D9VOXRRpC201
	j8xOWpZfndlNZlCSQxmA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gi00n-0004nI-N8; Fri, 11 Jan 2019 16:50:25 +0000
Received: from foss.arm.com ([217.140.101.70])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gi00Y-0003bV-9U; Fri, 11 Jan 2019 16:50:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 39A4D80D;
 Fri, 11 Jan 2019 08:50:07 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.72.51.249])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 06DD13F5AF;
 Fri, 11 Jan 2019 08:50:07 -0800 (PST)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
 id 5B34C6800E1; Fri, 11 Jan 2019 16:50:05 +0000 (GMT)
Date: Fri, 11 Jan 2019 16:50:05 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: Remove inconsistent use of 'arm,armv8'
 compatible string
Message-ID: <20190111165005.GI20661@e110455-lin.cambridge.arm.com>
References: <20190109202934.29304-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190109202934.29304-1-robh@kernel.org>
User-Agent: Mutt/1.11.2 (2019-01-07)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190111_085011_040671_7820F257 
X-CRM114-Status: GOOD (  17.54  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: Nishanth Menon <nm@ti.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiko Stuebner <heiko@sntech.de>, Maxime Ripard <maxime.ripard@bootlin.com>,
 linux-arm-msm@vger.kernel.org, Will Deacon <will.deacon@arm.com>,
 David Brown <david.brown@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Mark Rutland <mark.rutland@arm.com>, linux-renesas-soc@vger.kernel.org,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, arm@kernel.org,
 linux-rockchip@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Magnus Damm <magnus.damm@gmail.com>, Michal Simek <michal.simek@xilinx.com>,
 Wei Xu <xuwei5@hisilicon.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-samsung-soc@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Kukjin Kim <kgene@kernel.org>, bcm-kernel-feedback-list@broadcom.com,
 Baolin Wang <baolin.wang@linaro.org>, Andy Gross <andy.gross@linaro.org>,
 Orson Zhai <orsonzhai@gmail.com>, Tsahee Zidenberg <tsahee@annapurnalabs.com>,
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
 Jason Cooper <jason@lakedaemon.net>,
 Antoine Tenart <antoine.tenart@bootlin.com>, Ray Jui <rjui@broadcom.com>,
 Robert Richter <rrichter@cavium.com>, Simon Horman <horms@verge.net.au>,
 linux-mediatek@lists.infradead.org, Jayachandran C <jnair@caviumnetworks.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Scott Branden <sbranden@broadcom.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, Chanho Min <chanho.min@lge.com>,
 Duc Dang <dhdang@apm.com>, linux-kernel@vger.kernel.org,
 Tero Kristo <t-kristo@ti.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Jun Nie <jun.nie@linaro.org>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>,
 Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

T24gV2VkLCBKYW4gMDksIDIwMTkgYXQgMDI6Mjk6MzRQTSAtMDYwMCwgUm9iIEhlcnJpbmcgd3Jv
dGU6Cj4gVGhlICdhcm0sYXJtdjgnIGNvbXBhdGlibGUgc3RyaW5nIGlzIG9ubHkgZm9yIHNvZnR3
YXJlIG1vZGVscy4gSXQgYWRkcwo+IGxpdHRsZSB2YWx1ZSBvdGhlcndpc2UgYW5kIGlzIGluY29u
c2lzdGVudGx5IHVzZWQgYXMgYSBmYWxsYmFjayBvbiBzb21lCj4gcGxhdGZvcm1zLiBSZW1vdmUg
aXQgZnJvbSB0aG9zZSBwbGF0Zm9ybXMuCj4gCj4gVGhpcyBmaXhlcyB3YXJuaW5ncyBnZW5lcmF0
ZWQgYnkgdGhlIERUIHNjaGVtYS4KPiAKPiBSZXBvcnRlZC1ieTogTWljaGFsIFNpbWVrIDxtaWNo
YWwuc2ltZWtAeGlsaW54LmNvbT4KPiBDYzogTWFyayBSdXRsYW5kIDxtYXJrLnJ1dGxhbmRAYXJt
LmNvbT4KPiBDYzogV2lsbCBEZWFjb24gPHdpbGwuZGVhY29uQGFybS5jb20+Cj4gU2lnbmVkLW9m
Zi1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4KPiAtLS0KPiBhcm1zb2MgZm9sa3Ms
IFBsZWFzZSBhcHBseSBkaXJlY3RseS4KPiAKPiBOb3RlIHRoYXQgdGhlcmUncyBzdGlsbCBhIGNh
c2UgbGVmdCBpbiBtc204OTk4IHRoYXQgbmVlZHMgYSBuZXcgCj4gY29tcGF0aWJsZSBzdHJpbmcu
Cj4gCj4gUm9iCj4gCj4gIGFyY2gvYXJtNjQvYm9vdC9kdHMvYXJtL2p1bm8tcjEuZHRzICAgICAg
ICAgICB8ICAxMiArLQo+ICBhcmNoL2FybTY0L2Jvb3QvZHRzL2FybS9qdW5vLXIyLmR0cyAgICAg
ICAgICAgfCAgMTIgKy0KPiAgYXJjaC9hcm02NC9ib290L2R0cy9hcm0vanVuby5kdHMgICAgICAg
ICAgICAgIHwgIDEyICstCj4gIC4uLi9ib290L2R0cy9hcm0vdmV4cHJlc3MtdjJmLTF4djctY2E1
M3gyLmR0cyB8ICAgNCArLQoKRm9yIHRoZSBBcm0gTHRkIGJvYXJkczoKCkFja2VkLWJ5OiBMaXZp
dSBEdWRhdSA8bGl2aXUuZHVkYXVAYXJtLmNvbT4KClRoYW5rcywKTGl2aXUKCi0tIAo9PT09PT09
PT09PT09PT09PT09PQp8IEkgd291bGQgbGlrZSB0byB8CnwgZml4IHRoZSB3b3JsZCwgIHwKfCBi
dXQgdGhleSdyZSBub3QgfAp8IGdpdmluZyBtZSB0aGUgICB8CiBcIHNvdXJjZSBjb2RlISAgLwog
IC0tLS0tLS0tLS0tLS0tLQogICAgwq9cXyjjg4QpXy/CrwoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGlu
dXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
