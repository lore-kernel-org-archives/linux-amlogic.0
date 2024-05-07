Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22986C10F1A
	for <linux-amlogic@archiver.kernel.org>; Tue,  7 May 2024 10:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CARtuA2/CQSSq7WxcSKdErpMCtICIuW8RmkPyuicgqE=; b=GvhKIi/XFX6oqV
	vA2IZBGrnFzQvYdneuL7LUFeTWKCkqtB5B3xMZDeEOlGakhzy57ZsFB3HkkGZJVz2FW6kJtHx0RYp
	tPm2p3/ixRPMR+7RZ/qT/A4dWHBeqc/CacExny+fIz0cdOp4ZMf4V7zKLen1bwKeMMZUy+zXdqUZf
	LItQCAG1h/QCaCxtP2JkBYrT1VNfOIXgY2folKLKqISVL3ruiPenkWyfPzGERNC9u/rP3ILYyexu+
	vJH8xOR7XHoe57qmblQYMpdJzgZ1kjkXFdI5BZUdSvpgiqVa1yYK8S1stt/lYf9iBffBwj5hejPP1
	rTuB1q676xxsXp290tDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4Hg5-0000000ASNh-3mHM;
	Tue, 07 May 2024 10:04:05 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4Hg3-0000000ASMj-0gTp
	for linux-amlogic@lists.infradead.org;
	Tue, 07 May 2024 10:04:04 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-d9b9adaf291so2835619276.1
        for <linux-amlogic@lists.infradead.org>; Tue, 07 May 2024 03:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715076241; x=1715681041; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ENlfgQ3ADPUMWuBuiOLhnFoQNEtfud/j+QDtLaNAUG0=;
        b=X2uxh72jyQ6DJR22/pJf+d+1/RLRudll7AGX06iJfTViRhJKHjss33SvwBV76SgGYH
         adyV9sZJiyD1L+imI6g+KaRrPvOmeNJfyQATj1O6ZyjMp27SNVKNPH3d3mhA2ctfoJHA
         tej53GoJVf4jHjBOJIQCH2hA+8PF3a4wJA9605N3oh4/mB9RDJKYYmEDlc868SSjhXmk
         joshFBh4L72E9Ebne8uxNEKtI8wLzJzK85BIrb/bu/ai7YWpDB05evh77gIpbnUEDhYH
         2jt4Ce99uPoYxZYnor84feU8bQHm9bjbyDWWJkaHCtuvAKvHAHsGAUmXyCsaBgewGaIg
         XpxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715076241; x=1715681041;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ENlfgQ3ADPUMWuBuiOLhnFoQNEtfud/j+QDtLaNAUG0=;
        b=HqXoF7vLPSYETu4soIkQuVm9na0OLPy00KnfLprSPqMp0u7N05q5DxzkVwP9LBlPvc
         JR5sw3VR1WgTQInPoPKOhyoaIZXIsYS+sMCMTIqLmjaTXp+7znT4Xo2xEosSZdncfoMC
         AVLpNY7prhmd2XFUuJpn/K8/ze41D4MfOLmlCPzYu7Bs35fubj9ia0esQhPjN+YZXEMy
         V+Q31LIDV3KFXirK5UE9ThJPD9gekfZNkrJp3UjL9E9lULN5t7DYWPk9etLHP+pGjdZM
         PEuqfTjHv+F4SxoUJklBA0YxZSUXI3OFM3zaRJQE7EN/bJ+W9rOI8PQ91gpcjQCMlQBq
         pdVA==
X-Forwarded-Encrypted: i=1; AJvYcCWxcACb1NxXwd+YBENsKwxbnTn9mno97iOf8cHcEp6bINue9WDkTlMacCSIwoXmYV/uFzZGQ/bc8+oAVw3XIJVcNuL8JmOZfwnqCcOMjCoUEF4=
X-Gm-Message-State: AOJu0Yxsolj0TF9tERBS/7tS/HaM3hfd/pfQMXDdHotjZscoIZXgz+fN
	xsiC/pd1FXYHtc+rT8d4B2jXzfAJOdsxBUoU12h0r9U3F8jDOhWMpb7vzcYl7kiYqHciL2TEZE2
	mPnv05tQiOF0act2bYoDb93MelTLxBrEyVb7k9HzuRx4Vw97ZiOc=
X-Google-Smtp-Source: AGHT+IE6RbboWA6zivUgxElWhiInYBOoZKZxCooBjJtVLVKzpcY065ewr27Om73FjNB7+c1CsbFfoFINBaR1I1fIna4=
X-Received: by 2002:a5b:912:0:b0:de6:3c4:c3a with SMTP id a18-20020a5b0912000000b00de603c40c3amr12223334ybq.10.1715076241415;
 Tue, 07 May 2024 03:04:01 -0700 (PDT)
MIME-Version: 1.0
References: <20240506142142.4042810-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20240506142142.4042810-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 7 May 2024 12:03:50 +0200
Message-ID: <CACRpkda=a3X=jyZKQoOFrfgzpE2C+rZ9UC1VDnCvGL7QP4x4BA@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] PCI: controller: Move to agnostic GPIO API
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Frank Li <Frank.Li@nxp.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	linux-omap@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org, 
	Vignesh Raghavendra <vigneshr@ti.com>, Siddharth Vadapalli <s-vadapalli@ti.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Richard Zhu <hongxing.zhu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Yue Wang <yue.wang@amlogic.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Xiaowei Song <songxiaowei@hisilicon.com>, Binghui Wang <wangbinghui@hisilicon.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_030403_267895_0DA31322 
X-CRM114-Status: UNSURE (   7.44  )
X-CRM114-Notice: Please train this message.
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

T24gTW9uLCBNYXkgNiwgMjAyNCBhdCA0OjIy4oCvUE0gQW5keSBTaGV2Y2hlbmtvCjxhbmRyaXku
c2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+IHdyb3RlOgoKPiBJbiB2NDoKPiAtIGFkZGVkIHRh
ZyAoTWFuaSkKPiAtIGZpeGVkIGEgcG9sYXJpdHkgYnVnIGluIGlNWC42IGRyaXZlciAoTGludXMp
CgpMb29rcyBnb29kIG5vdy4gVGhlIHNlcmllczoKUmV2aWV3ZWQtYnk6IExpbnVzIFdhbGxlaWog
PGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KClBlcmhhcHMgdGhlIHVzZSBvZiAgX3JhdyBhY2Nl
c3NvcnMgY291bGQgYmUgYXZvaWRlZCBpbiA1LzUgYnkgc29tZQplbGFib3JhcnQgcG9sYXJpdHkg
cXVpcmsgYnV0IEknbSBubyBwZXJmZWN0aW9uaXN0IGFuZCBpdCBjYW4gYmUgZml4ZWQgbGF0ZXIu
CgpZb3VycywKTGludXMgV2FsbGVpagoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGludXgtYW1sb2dpY0Bs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtYW1sb2dpYwo=
