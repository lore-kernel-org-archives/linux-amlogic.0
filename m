Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC7C7C369A1
	for <linux-amlogic@archiver.kernel.org>; Tue,  8 Apr 2025 05:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v8gSNlEDiMl1z0KITh+oPiyZZANliCj8s6LMVyPMUgM=; b=adekmxpxUPPCie
	tK4bdySbsMk7SnaUs2FbwO5YRT+5YvHNxyQUp/l5pwsjGldv/ilZRph8V0rtpqXDNDaXopcqZch0J
	/MRq9OrnfLRJUBueQDUgWx/eFFVRCTpxTQD0KCctn1R9tdaj+rQf3qEDGSpZ5JTQB5iT4gr2VUxd8
	K2vSoDxGjyQfFA5tQq3pjo7jR+h1Ef5EprePeZaUAtyBVgqr6T2sFkRLjsyJjLlBeKqfriR+EspDk
	0mixEYPU9NGUaWznBjclP+H0AsWodFN/chp9HNhbr1OVIovWu+dRD0+nJ9AlcbZAnLmoMtqZtrWKT
	dIfP4MWOT8ICEmmMoyug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u21zM-00000002pTC-2oWS;
	Tue, 08 Apr 2025 05:59:12 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u21xZ-00000002pCx-2Usf
	for linux-amlogic@lists.infradead.org;
	Tue, 08 Apr 2025 05:57:24 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-301c4850194so4039738a91.2
        for <linux-amlogic@lists.infradead.org>; Mon, 07 Apr 2025 22:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744091841; x=1744696641; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ntWAqYw/FbTf3Hq91IVHWRfD1c0otTEdS+CQ7J427hE=;
        b=vnl9bLzttUyq4vUKC12DPjrZN9M3f2YwuTNQhCKsrASenvp4GM8O+Nm72lrm7uhekZ
         N1KgR8e2sT5FQY998Y2DG6Wm/+DsQdffFuhJmxq43iyDct/kDkL7R9vJKxLe+VXtE5Pv
         wEDQp1Q1YFxzPnBrtMbDbxFQGQQrRRHTLKUZY8I2De/1HP8DBtGTNj3CKy9j/1Sndv2b
         V0d3N6IiVkYaB5Zr+V1HJz9QKDPLYdSny8uwr1T7lH8EiSWr+gKPkPDYB7gTtEPkkZF/
         iowyA/M8pRwsuNQIfJ85dKIWn1mMSLllmM2JvmknfpsWsLBQVUqTbniwEYO6UIeWEjLI
         kohA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744091841; x=1744696641;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ntWAqYw/FbTf3Hq91IVHWRfD1c0otTEdS+CQ7J427hE=;
        b=gV65GM6OvoeHF+dGyNpCasBV9KlPmchM2telGxrnIzyMBZEawaM49QSnpJ+1Cw5Yyl
         mQjiTHJSPAXkNvPghJoDsvloqbmvTX86Dav9kQkC3kPXT5T6pdedQ5h+FlCmtsNkDkiD
         Ok4D7s0IySI0bA4xkIln6e/oBhz47uovDaiNjQNaRJuwFm+ZqwnQs/TrnSl4DHrWF5jt
         P9zOojWMIuTTOeWtDXIb9oOcTD8L9dOS6NkRIVCKA7I5Aq1Ug8bGDOtmL7eSbqmFqHxh
         4pUCZkNTsljHq6uRkGLNmAN1gPNefEGLzntx4T3SmumH+jEicBI3+oL6ZQDrsZeH0G26
         MD/Q==
X-Forwarded-Encrypted: i=1; AJvYcCU55pFjcORRuoEdH6IeKu8agh3RRdqMgXArbeW5vzb/n3DMJ3g5ym5Y0X44380W9oJlTHCN2exTLKJW6KFp@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/HVMVjajVPJPYikfAku6iFbzoqevQKGdX1DRGAsPYp9arFp6i
	C9pQiSO42JKMy1jBPhcuu9UF6ZkLeUq471s9Rf3WjpZ9yg/m1u6uyTNX1837WW8=
X-Gm-Gg: ASbGncvsSDcniO9qI2pNbI/5dR36noc3UDtrgXIPLZtHY7ECALnr3YxEuer+d4aYCyE
	omTEj+wGGqdKgF35yUP8yAokl/nj+9wbifspKVxgssbkFnp/1iifubJdmRknjap8wbUv47/lwsT
	1v3prtG5zC5AJkzFGvdl+md6frAEzDiEltAc6kdC4MiTccI+b8DUrH/pzrpVvwDLSkv0TpRVH92
	aJR6xh/TctJ699B4YeNsZ/hv0kdKOq81kdieqIlSYAbPKcaT8/0US/pMIIxHjQCTUN6AsptD9rf
	q0+6guCW/xOCKJgFei031SuAis80abj2xDAYHD3xkHvHIw==
X-Google-Smtp-Source: AGHT+IHa7mNtQoh2kE0P3zD2ru6aZMt+A87LdNqpNKujZXMzxAW0s8D/vDJRFgVZKF/JyFi3WYplYw==
X-Received: by 2002:a17:90b:2d08:b0:2ee:9b09:7d3d with SMTP id 98e67ed59e1d1-306a4894cd0mr18110280a91.19.1744091840732;
        Mon, 07 Apr 2025 22:57:20 -0700 (PDT)
Received: from localhost ([122.172.83.32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30588a3140asm10075622a91.29.2025.04.07.22.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 22:57:20 -0700 (PDT)
Date: Tue, 8 Apr 2025 11:27:18 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
	Stephen Boyd <sboyd@kernel.org>, zhouyanjie@wanyeetech.com,
	Conor Dooley <conor@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	UNGLinuxDriver@microchip.com, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-mips@vger.kernel.org, imx@lists.linux.dev,
	linux-rockchip@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 00/19] Arm cpu schema clean-ups
Message-ID: <20250408055718.4azlqljvo4qxhnu5@vireshk-i7>
References: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250403-dt-cpu-schema-v1-0-076be7171a85@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_225721_633933_15D072EA 
X-CRM114-Status: UNSURE (   6.92  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 03-04-25, 21:59, Rob Herring (Arm) wrote:
>  .../bindings/cpufreq/cpufreq-mediatek.txt          | 250 ---------------------
>  Documentation/devicetree/bindings/opp/opp-v1.yaml  |  18 +-

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
