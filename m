Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77866C433EF
	for <linux-amlogic@archiver.kernel.org>; Fri,  4 Mar 2022 23:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8f2Tc1FGNVWJcUs1fvSv0ifPoDi5hd7Z+94o2eAn824=; b=OKRBc4VOTQLMhr
	j3jtKv8nWqGeuFrUFVXwg54k8ryhyN9qkFhzMHJKR7ws2YsNQVPW0GplboHhR19mYrcxdRuS8Cg0A
	4god/ZslQqHJot6a5XPLWBVTZRJQD2DGL4Ihl+UYUYXWVW5Wvd7qNpaBAJCKMVzL0oUJxkwN6cmyg
	UowtzhZQAJRUvPCzR9I0H24eFaEsRhlj8Me+R0fUuswtrwVcLVq+525v/AIUu6SgWRpSJkgTaYqBa
	x3TkR1u+VnqcGdXCCvlc6eQVnvaz6o7frirts4RyASUaJIacjrqusavG/iHEl5e97PfW5qrxhxw2p
	jLpqVrbnjRuYr7+xTArg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQH1m-00CH0A-Qw; Fri, 04 Mar 2022 23:08:02 +0000
Received: from mail-oi1-f182.google.com ([209.85.167.182])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQH1Z-00CGwT-UU; Fri, 04 Mar 2022 23:07:51 +0000
Received: by mail-oi1-f182.google.com with SMTP id j24so9343504oii.11;
 Fri, 04 Mar 2022 15:07:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=EuVtOzmDY8KQtxviZjbiWvVDjL6QwHXJTtn2aF7LIXc=;
 b=jTRO8u8wqB3Dtfv2S4q22UBIKKGCkyL1Y5+azWOxcQLcTR6W/isc4ODlRatU1Wc8k4
 ppDCE7OfyG1yrjwODSDWbroOa+Rq02qbjM0v8eNwW2CqNKSTMK92Qq6G8pG4+z9zCBu8
 4ebVZIybL9RQmXgyLIKTXdFWpO1Jq+ThBYJqUcg/LvxE29U1yHrIUOk03FOV/SeFEt6q
 HWQFrAEKw1TJmZL90NdK8h5vJ586VEkV0PRWL9rb+ItntXXniXnAJBiPd3SYye6fLN/O
 5OxyHnip4IqDhabLO1hrOeZ77cEsRMj6xbj2SiZFWFD8ibivLEMrmrAINBrB/xp8Aiif
 IKIQ==
X-Gm-Message-State: AOAM533jRLjN9XGbYmrUYFr+nMTNf+1mWWT0PXGQ3aUi9Rt+7ZcxPWIE
 wPUWpIZu1eOGqQPwkX7R5w==
X-Google-Smtp-Source: ABdhPJzBMpgUUCLDYr6YbsXtD5Tw6YhhPdQRKDAFpiM7eprWpaKATZipSf90dkk5P62+xaVtLQfLoA==
X-Received: by 2002:a05:6808:148d:b0:2d9:a01a:4873 with SMTP id
 e13-20020a056808148d00b002d9a01a4873mr959275oiw.190.1646435268666; 
 Fri, 04 Mar 2022 15:07:48 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.gmail.com with ESMTPSA id
 e7-20020a056830200700b005a09222e268sm2889932otp.7.2022.03.04.15.07.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 15:07:47 -0800 (PST)
Received: (nullmailer pid 629083 invoked by uid 1000);
 Fri, 04 Mar 2022 23:07:46 -0000
Date: Fri, 4 Mar 2022 17:07:46 -0600
From: Rob Herring <robh@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Miguel Ojeda <ojeda@kernel.org>,
 "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>,
 Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
 Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v5 2/6] dt-bindings: auxdisplay: Add Titan Micro
 Electronics TM1628
Message-ID: <YiKbwv2mg3//5EAa@robh.at.kernel.org>
References: <90668779-b53d-b3e7-5327-af11ff4a1d18@gmail.com>
 <2671e6e3-8f18-8b70-244b-9e1415bfdf8f@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2671e6e3-8f18-8b70-244b-9e1415bfdf8f@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_150750_005204_A0EA2FA1 
X-CRM114-Status: GOOD (  10.70  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Fri, 25 Feb 2022 22:13:16 +0100, Heiner Kallweit wrote:
> Add a YAML schema binding for TM1628 auxdisplay
> (7/11-segment LED) controller.
> =

> This patch is partially based on previous work from
> Andreas F=E4rber <afaerber@suse.de>.
> =

> Co-developed-by: Andreas F=E4rber <afaerber@suse.de>
> Signed-off-by: Andreas F=E4rber <afaerber@suse.de>
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
> v5:
> - add vendor prefix to driver-specific properties
> ---
>  .../bindings/auxdisplay/titanmec,tm1628.yaml  | 92 +++++++++++++++++++
>  1 file changed, 92 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/auxdisplay/titanmec=
,tm1628.yaml
> =


Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
