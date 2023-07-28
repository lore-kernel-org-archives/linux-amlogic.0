Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D64CC00528
	for <linux-amlogic@archiver.kernel.org>; Fri, 28 Jul 2023 11:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fPIkGH/I1oNb86dELuJYYQJdVz1RcjKB5OfL6Dr3rqc=; b=E2xzq8jim1i+pi
	IfxNhNi/IvIougHnchmmMm/MTMItG3JkDW4c1aEd+cQHChcoQKi+Z7l9i1iU0A+LuP8FLTKnfQy+B
	fy1F5garv7k8vN4/ri15gFeGazhZGsxlYNV/0xEiuz/JPWBHG2t12Wl2S5T9D7QYvp1l4T/sb2uqv
	YqsZQCJj4coZwEaup4YnLUm8v4Qth8ViH2xGh1G9U73zgLv4nT9//Byg0dZVOeMomHombBCTwCW3U
	9kfFdmreE7k0TNAzhZuUN9EVNABEga9Y+F804LJ9kRXi7amDhLRT9y+t3S5DE73kWGztr6gw6n+ib
	zVEc0+ywbZMPJAZHchUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPLDG-0035rV-2r;
	Fri, 28 Jul 2023 11:00:50 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPLDD-0035qI-0C;
	Fri, 28 Jul 2023 11:00:48 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-55badd6d6feso324263a12.1;
        Fri, 28 Jul 2023 04:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690542044; x=1691146844;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jAU8K3a8dHy/tuEIb7Zpcs7Yfdt1964yvfWu4jQqUuw=;
        b=UrIAf3FUSIv8YxPhfTK3nLv5IcWt5sxAS/MbAn3DuvkbIaHb7LD1g2rsl9yDEOwdSh
         3vY0iX48P3rU4dTxIJB9eIHtKllX7TF/TQCeOHzvgsz3cWjLPstf2rQNO1zJWaoQn/gT
         UDXJsAlFDdBYgpQbSjyavgIMkKIzTkwmiiGHFsWFrOlEcyrmWSTfsQa90rXEFhKycdx3
         sDsjhtBzBwTjeYOFc5jeJUg3L02N3lkPbPRcUAFljwl+lxlzHq8CKGg/m/bq7o/rlqbu
         fBbHr2TW9PfmJwxLS25qzOzPs3WbUxIe2YYi58UyCNVMDhLqbq9r2TYFdyq5zGHKFDSJ
         cKGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690542044; x=1691146844;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jAU8K3a8dHy/tuEIb7Zpcs7Yfdt1964yvfWu4jQqUuw=;
        b=DwaBlR1GR52rsUDDmS+2exVJerTI06lOQOEZESSn0bSRLaTtOA0+/wWmvF++WK2muR
         qm4sRhSQ2mID33UGOjvOwcYPIyVernz3JMKr0nCxChTKnpl6qJFhvi+ADdBXEqWmkNrj
         2TF67wS+0SAxDl4POCgMXd0FEz0tplQXFZpvdtetKHl4Z8tr/5c31Sh1xmcNu3os/eKX
         gWYrRYTmSTVm+kp61mWptFsPONZh+WZDR6/xd5BiR8CThfazKzx0UXe8V2JdzS74PxdW
         e8LFpbP3qI4tfLtZUHaRVmF7mscn+XhmWmJhKHxYoYM1VDs8NOU7qbhXHJ45ICsCAJOH
         fhsQ==
X-Gm-Message-State: ABy/qLbSS1lhAL55TcAuh2Xl0OpGTStkCxrhWLJ3hy2BOHYvF+zI1GF7
	TVaOMGvCIPvqEtFT6grQFhTVObv9++AHj4MGGt0=
X-Google-Smtp-Source: APBJJlFRUaRTonS8rZhdy8awwpxcfDvB90VkuyRkJuU4rORotvPAMG3r669s1DgV5c8fsVRmEz9c48FJa+0b7z7329Q=
X-Received: by 2002:a17:90a:e4f:b0:267:f1dc:74ee with SMTP id
 p15-20020a17090a0e4f00b00267f1dc74eemr1975393pja.2.1690542044042; Fri, 28 Jul
 2023 04:00:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230727152503.2199550-1-shenwei.wang@nxp.com> <20230727152503.2199550-3-shenwei.wang@nxp.com>
In-Reply-To: <20230727152503.2199550-3-shenwei.wang@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 28 Jul 2023 08:00:32 -0300
Message-ID: <CAOMZO5ANQmVbk_jy7qdVtzs3716FisT2c72W+3WZyu7FoAochw@mail.gmail.com>
Subject: Re: [PATCH v2 net 2/2] net: stmmac: dwmac-imx: pause the TXC clock in fixed-link
To: Shenwei Wang <shenwei.wang@nxp.com>, Andrew Lunn <andrew@lunn.ch>
Cc: Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Vinod Koul <vkoul@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	NXP Linux Team <linux-imx@nxp.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Bhupesh Sharma <bhupesh.sharma@linaro.org>, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, Simon Horman <simon.horman@corigine.com>, 
	Andrew Halaney <ahalaney@redhat.com>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Wong Vee Khee <veekhee@apple.com>, Revanth Kumar Uppala <ruppala@nvidia.com>, 
	Jochen Henneberg <jh@henneberg-systemdesign.com>, netdev@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, imx@lists.linux.dev, 
	Frank Li <frank.li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_040047_104803_A8C5DC10 
X-CRM114-Status: UNSURE (   9.92  )
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

T24gVGh1LCBKdWwgMjcsIDIwMjMgYXQgMTI6MjXigK9QTSBTaGVud2VpIFdhbmcgPHNoZW53ZWku
d2FuZ0BueHAuY29tPiB3cm90ZToKCj4gICAgICAgICBzdHJ1Y3QgcGxhdF9zdG1tYWNlbmV0X2Rh
dGEgKnBsYXRfZGF0ID0gcHJpdjsKPiBAQCAtMzE3LDggKzM1OSwxMSBAQCBzdGF0aWMgaW50IGlt
eF9kd21hY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAgICAgICAgcGxh
dF9kYXQtPmV4aXQgPSBpbXhfZHdtYWNfZXhpdDsKPiAgICAgICAgIHBsYXRfZGF0LT5jbGtzX2Nv
bmZpZyA9IGlteF9kd21hY19jbGtzX2NvbmZpZzsKPiAgICAgICAgIHBsYXRfZGF0LT5maXhfbWFj
X3NwZWVkID0gaW14X2R3bWFjX2ZpeF9zcGVlZDsKPiArICAgICAgIGlmIChvZl9tYWNoaW5lX2lz
X2NvbXBhdGlibGUoImZzbCxpbXg5MyIpKQo+ICsgICAgICAgICAgICAgICBwbGF0X2RhdC0+Zml4
X21hY19zcGVlZCA9IGlteF9kd21hY19maXhfc3BlZWRfbXg5MzsKClNvIHlvdSBhcmUgZm9yY2lu
ZyB0aGlzIG9uIGFsbCBpbXg5MyBib2FyZHMsIGV2ZW4gaWYgdGhleSBkb24ndCB1c2UgYSBTSkEx
MTA1LgoKQW5kcmV3IEx1bm4gZ2F2ZSB0aGUgZm9sbG93aW5nIGZlZWRiYWNrIGluIHYxOgoKIlRo
ZSBTSkExMTA1IGhhcyB0aGUgcHJvYmxlbSwgc28gaSB3b3VsZCBleHBlY3QgaXQgdG8gYmUgaW52
b2x2ZWQgaW4KdGhlIHNvbHV0aW9uLiBPdGhlcndpc2UsIGhvdyBpcyB0aGlzIGdvaW5nIHRvIHdv
cmsgZm9yIG90aGVyIE1BQwpkcml2ZXJzPwoKTWF5YmUgeW91IG5lZWQgdG8gZXhwb3NlIGEgY29t
bW9uIGNsb2NrIGZyYW1ld29yayBjbG9jayBmb3IgdGhlIFRYQwpjbG9jayBsaW5lLCB3aGljaCB0
aGUgU0pBMTEwNSBjYW4gZGlzYWJsZS9lbmFibGU/IFRoYXQgdGhlbiBtYWtlcyBpdApjbGVhciB3
aGF0IG90aGVyIE1BQyBkcml2ZXJzIG5lZWQgdG8gZG8uIgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtYW1sb2dpYyBtYWlsaW5nIGxpc3QKbGlu
dXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtYW1sb2dpYwo=
