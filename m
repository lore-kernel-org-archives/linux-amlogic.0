Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC5ECC6B34
	for <linux-amlogic@archiver.kernel.org>; Thu, 15 Oct 2026 09:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nw+XHj+DkK3zFvyMDKGnqgcRGpZ3B3MNJDzXGVK5uUw=; b=Ykmb4/5UkW1PPu
	UzEm3aacxoF8rgSmBuqsZmWCpHQf7VlwnWN1Pa01C3ipDxaPLXyCGlnYr9bpEePXCoWWYkeUlnqMG
	802kUoSW3l8gjdSApZDgviO1rZ0a7j0l6maryk7gZICwhjmdEZ9JbWS6515p/X814yq8n9gWk8PoF
	3VUEsvCwUiubM430752x3f7/77RzCzsKHI8K8Don1RFmReHqsDl9TBqX61c4TRGdEgJp0gzUjjk4e
	SqyTLlxck22L8GC73dy+hLLN4B3/vXFWiBidUaxLpjeqBX+TRDb5ir5x6qzg+fBIzb1/y6LzNn+Yj
	0NzFKbLZQXDibVFAZVAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHHKH-0000000HCtU-2uH8;
	Thu, 15 Oct 2026 09:00:38 +0000
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHHKC-0000000HCr4-1xzL
	for linux-amlogic@lists.infradead.org;
	Thu, 15 Oct 2026 09:00:34 +0000
Received: by mail-yx1-xb12f.google.com with SMTP id 956f58d0204a3-677d35fd1d2so1504394d50.1
        for <linux-amlogic@lists.infradead.org>; Thu, 15 Oct 2026 02:00:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792054827; cv=none;
        d=google.com; s=arc-20260327;
        b=Yc7DvlCtk3ZBB7IJIyDGANfmRD3YOKIXdgRBEktjHvdw+zIQHFIJKNGxLQGmZE+Azu
         nrRTl2y7hlOdX9MfDhcvq6rhbNCmWAuDhF93CLw2UORUxwOyrCG4awtsFcfRuU03WpT6
         rinv0ya8SDS2tOB6I3tYZs9gFiORlVpSF037feHtdFuTwjsW+ClqQDSmEY5QP3f81LCW
         R+u9ZwCdJoWLi+Ak+wjhTZ4DS2mg8AZMSxcg9DgUDHOwskNqFX3CknFtxZyc9hlaHNF6
         BnaINTBi6DvCgxXO35Kn2mVJh1qPZsNK0IvSJ5T066YWn44FDbKDwhWo0smEiA7CmVcj
         HsXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=H2bwf3Gv5oNr3T6PPFbiYLp5czeo2CNPZ2amlY5zFVU=;
        fh=CLIcPo5H39iUSu3OUB5/ZWcvrXl2gzaeGa/28iI155c=;
        b=NL1cp/bDPYcQM3K8Qeo/Y4UJnhSa2RHxrJLr4b7wmTg9IOtVQef0v4yJTsToha0M1x
         3yNW8j+dsy0OuFvHWMR2gVLHKO6WjKNpYOledlphbDCrYIg8jSteMh5tG+N53w7apn7h
         T+VPvqlMSJaQy7SOV96NPl3g4MsLo5PqenjEu3cVs9AbP1ceiOI9NdNZRsxptguI71zS
         rfLkK5Y7nxP1qBqBPLe2WHDBBuYyCz5v3CcPtQZGsTj6YQcakQWp97PX7YlHGSt57BM/
         RlL1G0yt0+qVhyIkLcx5fR9rOg0rH6AYD/mcETGmn4tHx7ZRlLsormr8asH7hmJGxdUz
         aSyA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792054827; x=1792659627; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=H2bwf3Gv5oNr3T6PPFbiYLp5czeo2CNPZ2amlY5zFVU=;
        b=lUrWq00CEXpNQb7Y/jyPMFEXluKqklVVE06erlfq0yZTbwMnfnl2MwgKAuG+QkSsev
         SzryBikODMRpH/7ffaPDjhQje/nmOxg3i7uGv7jRjQk3NzrMILu4EuQc1ppHzLkFB9Jk
         OJJGNDvgLSW89Q6RN/76RtLY9oeZXzEuBikpY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792054827; x=1792659627;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H2bwf3Gv5oNr3T6PPFbiYLp5czeo2CNPZ2amlY5zFVU=;
        b=klu2IpRJY8KyBeVfYD+bd5luJmm7ELLvCpfs7mC9aPOmoX1XFoksU4WhRhsIs5Hf5h
         VVuYDxVA5tKwe2hBQYJp19mGLbKqovXtnefssX43uVk8kSkpaeNTWm7KXEo9jl5GewI+
         4+sKiKNAYxU34g9wqI7DD8Fe1dCHNq/OJJ28kleMgA3Z5SuVGSpY97XI9FDkTlIc1xO8
         Irhxuw8q4ZVL1+4oZyquO6aXWbqlH0KDb6cwoGg7daWk/84G33i74YLg7Fh2XzfRH4rH
         rzBSroq853dUaP0BFd7rfCR9EFvCH9+LUIRO/hEx9kf0NIWb6iz1IBhSts/piufn2CNP
         SUtw==
X-Forwarded-Encrypted: i=1; AKwUvBwGkNKG+CNiOLmLwuyKtwBanTkEp+xt7K7I7NZTC+NJn1H0s+LN8fuE/D2lSpwVExzClNvr4pfAV6XPFB6X@lists.infradead.org
X-Gm-Message-State: AFq9FYKQGfoCbeW/jkfUBKCcu88LJNj0B1bOE1AgBJRnFwfBHAIsV4hZ
	syRemfDVtZVz0WIS8NpGpbJ63U1WLslsjrN750mag56Lou+P/3cOP/5NwFqTckY6/f1jAIzbYCG
	hJENYOyhiZ5LsFDD4Q9vITmKiFRl4MlqAWRlAxcfz
X-Gm-Gg: AYBFou1508+pCfmmW6E8neBL9FXMBbWSuwaiVjvf2cvJy7xffArxjU7La2pPtA1eL6l
	59Ce/wemzyxccfUFogdF0S6/VZ0ymjfYAIu5W1y37h6rWoUGSry+L18yA3dtrtXIcX/HSlalW+7
	hSUhgyRzzDw+bBh2B7pdqfJ9FgwcgxD/tNvnLbaZbs59RLJSPUpjo3QgPTiZWoCgoxdR/HlOPPB
	8AbqObkQf4OMamC3TKKcrmibXyfHwEIaiGC1dlhhFBkPWORhhaYrpZMHKO5R+zz04ZjXTjBlT3B
	P6BozteJBYa3G1GMbAGQDaqbIWTfn8Qj5+3j6vdVQvvYkHkw4KmH4IZzSORrPp3BX1A=
X-Received: by 2002:a53:ac9e:0:b0:675:449d:3d74 with SMTP id
 956f58d0204a3-679362786a1mr5012542d50.92.1792054826173; Thu, 15 Oct 2026
 02:00:26 -0700 (PDT)
MIME-Version: 1.0
References: <20261014082037.1774672-1-wenst@chromium.org> <20261014082037.1774672-3-wenst@chromium.org>
 <7020a7a6-332e-4fd0-a659-d82eb768614c@linaro.org> <CAGXv+5G1kgyumbj7wGf6rPFbg3spSO0zYmEkn-hZT4qUdJbytA@mail.gmail.com>
 <03375a31-0ac6-47a4-b0dc-6327080e1622@linaro.org> <b4c0761b-34f2-42ad-97e7-ab34ae776281@oss.qualcomm.com>
 <8d4d3ec2-3c97-4a46-97f8-048fdf81b853@linaro.org>
In-Reply-To: <8d4d3ec2-3c97-4a46-97f8-048fdf81b853@linaro.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 15 Oct 2026 18:00:14 +0900
X-Gm-Features: AclHuK909vzDVZhhmMGqz8RNS4kIz2k4tldUZDjIEfGnLkXIyAs5uz5oF7-pLmQ
Message-ID: <CAGXv+5G_ig=k-eH8Cp0ES70WxTHcBS2TVj9VmHaG9caROiAuQQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: usb: snps,dwc3: Fix downstream port numbering
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <balbi@kernel.org>, 
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
	spacemit@lists.linux.dev, Mathias Nyman <mathias.nyman@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_020032_563714_F1743E39 
X-CRM114-Status: GOOD (  39.15  )
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

KENjLWVkIE1hdGhpYXMsIHRoZSB4SENJIGRyaXZlciBtYWludGFpbmVyIGluIGNhc2UgSSBtaXN1
bmRlcnN0b29kIHhIQ0kuKQoKT24gVGh1LCBPY3QgMTUsIDIwMjYgYXQgNDo0NOKAr1BNIE5laWwg
QXJtc3Ryb25nCjxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPiB3cm90ZToKPgo+IE9uIDEwLzE0
LzI2IDE4OjM2LCBLb25yYWQgRHliY2lvIHdyb3RlOgo+ID4gT24gMTAvMTQvMjYgMTE6NDQgQU0s
IE5laWwgQXJtc3Ryb25nIHdyb3RlOgo+ID4+IE9uIDEwLzE0LzI2IDExOjI5LCBDaGVuLVl1IFRz
YWkgd3JvdGU6Cj4gPj4+IE9uIFdlZCwgT2N0IDE0LCAyMDI2IGF0IDU6MjjigK9QTSBOZWlsIEFy
bXN0cm9uZwo+ID4+PiA8bmVpbC5hcm1zdHJvbmdAbGluYXJvLm9yZz4gd3JvdGU6Cj4gPj4+Pgo+
ID4+Pj4gT24gMTAvMTQvMjYgMTA6MjAsIENoZW4tWXUgVHNhaSB3cm90ZToKPiA+Pj4+PiBUaGUg
RFdDMyBjb250cm9sbGVyIGNhbiBvcGVyYXRlIGluIGhvc3QgbW9kZS4gSXQgZG9lcyBzbyB3aXRo
IGEgWEhDSQo+ID4+Pj4+IGNvbXBsaWFudCBob3N0IGNvbnRyb2xsZXIuIFRoZSBYSENJIGhhcyB0
d28gZG93bnN0cmVhbSBwb3J0cywgb25lIGZvcgo+ID4+Pj4+IEhTIGFuZCBvbmUgZm9yIFNTLiBV
U0IgZG93bnN0cmVhbSBwb3J0cyBzdGFydCBmcm9tIDEsIG5vdCAwLgo+ID4KPiA+IFsuLi5dCj4g
Pgo+ID4KPiA+Pj4gSU1ITyBoYXZpbmcgY29uc2lzdGVudCBudW1iZXJpbmcgYWNyb3NzIGNvbnRy
b2xsZXIgdHlwZXMgd291bGQgYmUKPiA+Pj4gYmV0dGVyLiBUaGlzIGF2b2lkcyBtYWtpbmcgdGhl
IFVTQiBjb3JlIGFuZCBodWIgY29kZSBkZWFsIHdpdGggbW9yZQo+ID4+PiBleGNlcHRpb25zLCBh
bmQgYWxzbyBlYXNpZXIgdG8gdW5kZXJzdGFuZCBhbmQgd3JpdGUgZGV2aWNlIHRyZWVzLgo+ID4+
Cj4gPj4gSSB3YXMgaW4gdGhlIGltcHJlc3Npb24gdGhlIHBvcnQgbnVtYmVyIG5vdCBuZWNlc3Nh
cmlseSByZWZsZWN0cwo+ID4+IGFuIGFjdHVhbCBwaHlzaWNhbCBudW1iZXJpbmcsIGFuZCBjYW4g
YmUgYSBsb2dpY2FsIG51bWJlciB3ZSB3b3VsZAo+ID4+IHRoZW4gbWFwIGluIHRoZSBrZXJuZWwu
Cj4gPj4KPiA+PiBJIGRvbid0IHNlZSBhbnkgaXNzdWUgaGVyZSBoYXZpbmcgYmFzZSAwIGZvciB0
aGUgYmluZGluZ3MgYW5kIHRoZW4KPiA+PiBjb252ZXJ0aW5nIGl0IHRvIGJhc2UgMSBmb3IgdGhl
IFhIQ0kgcG9ydCBudW1iZXJpbmcuCj4gPgo+ID4gSSB0aG91Z2h0IGJhc2UxIGNvbWVzIGZyb20g
dGhlIFVTQiBzcGVjIGFuZCBub3QganVzdCBYSENJPwo+Cj4gVGhpcyBpcyBteSBxdWVzdGlvbiwg
aXMgdGhlIHNwZWMgc2F5czogZWFjaCBVU0IgSG9zdCBDb250cm9sbGVyIHJvb3QKPiBwb3J0IHNo
YWxsIGJlIGNvbnNpZGVyZWQgYXMgYSBwb3J0IG9mIGEgSHViIGFuZCBudW1iZXJlZCB0aGUgc2Ft
ZSB3YXksCj4gdGhlbiBmaW5lLCBsZXQncyB1c2UgdGhlIGJhc2UxIG51bWJlcmluZy4KPgo+IEFz
IEkgdW5kZXJzdGFuZCBob3cgVVNCIGlzIGFyY2hpdGVjdHVyZWQsIGFsbCBkb3duc3RyZWFtIHBv
cnRzIG9mIEh1YnMKPiBhcmUgbnVtYmVyZWQgaW4gYmFzZTEsIGFuZCB0aGUgd2hvbGUgdG9wb2xv
Z3kgaXMgYmFzZWQgb24gdGhhdC4KPgo+IEJ1dCBoZXJlLCB3ZSBhcmUgc3BlYWtpbmcgb2YgcGh5
c2ljYWxseSBzZXBhcmF0ZSBVU0IgYnVzc2VzLCBvbmUKPiBVU0IyLjAgYW5kIG9uZSBVU0IzLjAs
IGEgY29udHJvbGxlciBjb3VsZCBhbHNvIGhhdmUgMTAgVVNCMi4wIHBvcnRzCj4gYW5kIDUgVVNC
My4wIHBvcnRzLCB3aG8ga25vd3MuIFRoZSB3YXkgdGhvc2Ugd2lsbCBiZSBudW1iZXJlZCBpcyBu
b3QKPiBwYXJ0IG9mIHRoZSBzcGVjaWZpY2F0aW9uIGJlY2F1c2UgdGhlIHNwZWNpZmljYXRpb24g
b25seSB0aGUgZGVmaW5lcwo+IHRoZSB0b3BvbG9neSBvZiBhbiBVU0IgYnVzLCBsaWtlIFBDSShl
KSBkZWZpbmVzIHRoZSB0b3BvbG9neSBvbiBhIFBDSShlKSBidXMuCgpObywgdGhlIFhIQ0kgc3Bl
YyBhY3R1YWxseSBzcGVjaWZpZXMgaG93IHRvIGlkZW50aWZ5IHRoZSBudW1iZXIgb2YgcG9ydHMK
YW5kIHdoaWNoIHBvcnQgc3VwcG9ydHMgd2hhdCB2ZXJzaW9uLiBTZWUgYmVsb3cuCgo+IEhvdyB3
ZSBhZ2dyZWdhdGUgYWxsIHRob3NlIGJ1c3NlcyB0byBhYnN0cmFjdCB0aGVtIHRvIHNvZnR3YXJl
IGlzIG5vdAo+IHBhcnQgb2YgdGhlIHNwZWMsIHdlIGNob3NlIHRvIGRlY2xhcmUgYSBmYWtlIHJv
b3QgSHViIHdpdGggYSBwaHlzaWNhbAo+IGRvd25zdHJlYW0gcG9ydCBhcyBhIHZpcnR1YWwgcG9y
dCBvZiB0aGUgcm9vdCBIdWIsIGZpbmUgYnV0IHRoaXMgaXMKPiBwdXJlbHkgc29mdHdhcmUgYWJz
dHJhY3Rpb24uCgpBcyBmYXIgYXMgSSB1bmRlcnN0YW5kIHRoZSBpbXBsZW1lbnRhdGlvbiBpbiBM
aW51eCBhbmQgdGhlIFhIQ0kgc3BlYywKdGhlIFhIQ0kgaGFyZHdhcmUgcmVnaXN0ZXJzIGdpdmUg
dGhlICJtYXhpbXVtIG51bWJlciBvZiBwb3J0cyIgaW4KSENTUEFSQU1TMS4gVGhlbiB0aGVyZSBp
cyBhdCBsZWFzdCAxICJ4SENJIFN1cHBvcnRlZCBQcm90b2NvbCBDYXBhYmlsaXR5IgplbnRyeSBp
biB0aGUgIkV4dGVuZGVkIGNhcGFiaWxpdGllcyIgc2VjdGlvbiB0aGF0IGRlc2NyaWJlcyBhIGdy
b3VwIG9mCnBvcnRzIChvZmZzZXQgYW5kIG51bWJlcikgYW5kIHRoZSBVU0IgcHJvdG9jb2wgc3Vw
cG9ydGVkIGJ5IHRoYXQgZ3JvdXAuCgpVc2luZyB0aGUgZXhhbXBsZSBnaXZlbiBieSB0aGUgWEhD
SSBzcGVjIG9uIHBhZ2UgMzMwIGFzIGZpZ3VyZSA0LTM1OgoKICAgIFhIQ0kgcG9ydCAxOiBIUyBv
biBwaHlzaWNhbCBwb3J0IDEKICAgIFhIQ0kgcG9ydCAyOiBIUyBvbiBwaHlzaWNhbCBwb3J0IDIK
ICAgIFhIQ0kgcG9ydCAzOiBIUyBvbiBwaHlzaWNhbCBwb3J0IDMKICAgIFhIQ0kgcG9ydCA0OiBI
UyBvbiBwaHlzaWNhbCBwb3J0IDQKICAgIFhIQ0kgcG9ydCA1OiBTUyBvbiBwaHlzaWNhbCBwb3J0
IDMKICAgIFhIQ0kgcG9ydCA2OiBTUyBvbiBwaHlzaWNhbCBwb3J0IDQKClRoZSBEVCB3b3VsZCBi
ZSBzb21ldGhpbmcgbGlrZToKCiAgICB4aGNpIHsKICAgICAgICBwb3J0cyB7CiAgICAgICAgICAg
IHBvcnRAMSB7IC8qIGdyYXBoIHRvIEhTIEVQIG9uIFVTQiBBIGNvbm5lY3RvciAxICovIH07CiAg
ICAgICAgICAgIHBvcnRAMiB7IC8qIGdyYXBoIHRvIEhTIEVQIG9uIFVTQiBBIGNvbm5lY3RvciAy
ICovIH07CiAgICAgICAgICAgIHBvcnRAMyB7IC8qIGdyYXBoIHRvIEhTIEVQIG9uIFVTQiBBIGNv
bm5lY3RvciAzICovIH07CiAgICAgICAgICAgIHBvcnRANCB7IC8qIGdyYXBoIHRvIEhTIEVQIG9u
IFVTQiBBIGNvbm5lY3RvciA0ICovIH07CiAgICAgICAgICAgIHBvcnRANSB7IC8qIGdyYXBoIHRv
IFNTIEVQIG9uIFVTQiBBIGNvbm5lY3RvciAzICovIH07CiAgICAgICAgICAgIHBvcnRANiB7IC8q
IGdyYXBoIHRvIFNTIEVQIG9uIFVTQiBBIGNvbm5lY3RvciA0ICovIH07CiAgICAgICAgfTsKICAg
IH07Cgo+IFdlIG1heSBvbmx5IHVzZSB0aGUgaGFyZHdhcmUgSVAgcG9ydCBudW1iZXJpbmcgaW4g
dGhlIGJpbmRpbmdzLCBub3QKPiB0aGUgc29mdHdhcmUgYWJzdHJhY3Rpb24uCgpBbmQgd2UgYXJl
IHVzaW5nIGhhcmR3YXJlIHBvcnQgbnVtYmVyaW5nLiBJdCdzIGp1c3QgdGhlIG51bWJlcnMgdXNl
ZAphcmUgdGhlIHBoeXNpY2FsIHBvcnQgbnVtYmVycyBmcm9tIHRoZSBYSENJIHJlZ2lzdGVycywg
bm90IHRoZSBsb2dpY2FsCnBvcnQgbnVtYmVycyBvbiB0aGUgcm9vdCBodWJzLgoKSW4gZmFjdCwg
d2UgY291bGQgc2F5IHRoYXQgdGhlIHBvcnQgbnVtYmVycyBvbiB0aGUgcm9vdCBodWJzIGZvciBY
SENJCmFyZSBtYWRlIHVwLgoKPiBXZSBjb3VsZCB1c2UgdGhlIGJhc2UxIHRvIGRlc2NyaWJlIHRo
ZSBEV0MzIHBvcnRzLCBidXQgaG93IHRvIGRlc2NyaWJlCj4gYWxsIHRoZSBwaHlzaWNhbCBVU0Ig
YnVzc2VzIGEgY29udHJvbGxlciBjYW4gZXhwb3NlID8gV2UgbWF5IG5vdCBsaW1pdAo+IHRoZSBi
aW5kaW5ncyB0byBVU0IyLjAgYW5kIFVTQjMuMCBwb3J0cyBvbmx5LgoKVGVjaG5pY2FsbHksIHRo
ZXJlIGlzIG9uZSBidXMgZm9yIFVTQiAyLjAgYW5kIG9uZSBidXMgZm9yIFVTQiAzLjAuIEJ1dApj
dXJyZW50bHkgZm9yIFhIQ0kgaW4gRFQsIHdlIGRlc2NyaWJlIHRoZSBoYXJkd2FyZSBwb3J0cyBk
aXJlY3RseSwKcmVnYXJkbGVzcyBvZiB0aGUgVVNCIHByb3RvY29sIHRoZXkgc3VwcG9ydC4KCkkg
ZG9uJ3Qga25vdyB3aHkgd2UgZG9uJ3QgZGVzY3JpYmUgdGhlIHJvb3QgaHViLCBidXQgbWF5YmUg
aXQncyBiZWNhdXNlCnByaW9yIHRvIFhIQ0kgdGhlIGNvbnRyb2xsZXIgYW5kIHJvb3QgaHViIHdl
cmUgdGhlIHNhbWUgZW50aXR5PyBFdmVuIGZvcgpYSENJLCB0aGUgcm9vdCBodWIgaXMgbW9yZSBv
ZiBhIGxvZ2ljYWwgZW50aXR5LgoKQW5kIEFGQUlDVCwgdGhlIGhhcmR3YXJlIHJlZ2lzdGVycyBk
b24ndCBkaXN0aW5ndWlzaCBiZXR3ZWVuIHBvcnRzIG9uIHRoZQpVU0IgMi4wIHJvb3QgaHViIHZz
IHRoZSBVU0IgMy4wIHJvb3QgaHViLiBUaGUgcG9ydCBjb250cm9sIHJlZ2lzdGVycyBhcmUKanVz
dCBpbiBhbiBhcnJheSwgaW5kZXhlZCBmcm9tIDEgdG8gbWF4UG9ydHMsIGkuZS4gdGhlIHBoeXNp
Y2FsIGluZGV4LgoKPiBIb3cgYWJvdXQgdGhlIFVTQjQsIGRvZXMgaXQgdXNlIHRoZSBVU0IzLjAg
cG9ydCA/CgpJJ20gbm90IGZhbWlsaWFyIHdpdGggVVNCNC4gQSBxdWljayBzZWFyY2ggc2F5cyB0
aGF0IGl0IGNhbiB0dW5uZWwKVVNCIDMueCwgRFAsIGFuZCBQQ0llLCBhbmQgaXQgZG9lc24ndCBo
YXZlIGl0cyBvd24gVVNCIEhDSSBkZWZpbmVkLgoKU28gSSdtIHRoaW5raW5nIHRoZSBVU0I0IGNv
bnRyb2xsZXIgd291bGQgYmUgbW9yZSBsaWtlIGEgbmV4dXMgbm9kZQpvciBtdWx0aXBsZXhpbmcg
bm9kZSwgb3IgcGVyaGFwcyBsaWtlIGEgVVNCIEMgY29ubmVjdG9yLiBJdCBoYXMgaW5wdXQKcG9y
dHMgZm9yIGFsbCB0aGUgcHJvdG9jb2xzIGl0IGNhbiB0dW5uZWwsIGNvbm5lY3RlZCB0byB0aGVp
ciByZXNwZWN0aXZlCmNvbnRyb2xsZXJzIChYSENJLCBEUCwgUENJZSkuIFRoZSBiaW5kaW5nIHBy
b2JhYmx5IHdvdWxkIGJlIHZlcnkgbWVzc3kKaWYgb25lIGNvbnRyb2xsZXIgc3VwcG9ydGVkIG11
bHRpcGxlIG91dGdvaW5nIHBvcnRzLCBhcyBlYWNoIGRvd25zdHJlYW0KcG9ydCBoYXMgYSAzLXRv
LTEgcmVsYXRpb25zaGlwIHdpdGggaXRzIHJlc3BlY3RpdmUgdXBzdHJlYW0gcHJvdG9jb2wKaW50
ZXJmYWNlcy4KCgpDaGVuWXUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LWFtbG9naWMgbWFpbGluZyBsaXN0CmxpbnV4LWFtbG9naWNAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LWFtbG9naWMK
