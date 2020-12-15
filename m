Return-Path: <SRS0=n1R+=FT=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F277DC4361B
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Dec 2020 13:40:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AAA7D2250F
	for <linux-amlogic@archiver.kernel.org>; Tue, 15 Dec 2020 13:40:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AAA7D2250F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AaQVIVJwAHtyffI9P5dx7wwjNYXuEbxpqJW6yE6lYo0=; b=EC/WAanqOPtsbCMiB5UvX1/5w
	kmrv8PWGILu2iu1iQdcmPySziaBqiiuW6yWTtOptsrIujsMXMC4iHp4PKcywoi9JMSOp+/G1Ue2rb
	ytgJ1C4kve25/WwZJxBf7qnahzYidrtIFYlAXugzoC4laW3ytpwVLANamtSO6KFyxbggsIRJtuTaB
	tQkAYTM+tzNBU5LiQVVdBJ58xHpLqMBsp3csCPR6gahwXe8dVDMRWWm2x29TblIOblLZfC2ypHiy7
	PZNzUEGor+19pa7kXqq2uqcCe36bG7Kb/JesPRvSlTt62t2ujfpNfix+B6oU9E89RvmsfVSzFfMa8
	4DQPu2OJA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpAZM-0003DN-SG; Tue, 15 Dec 2020 13:40:48 +0000
Received: from mail-oo1-f67.google.com ([209.85.161.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpAZF-00037r-U2; Tue, 15 Dec 2020 13:40:46 +0000
Received: by mail-oo1-f67.google.com with SMTP id i18so4821953ooh.5;
 Tue, 15 Dec 2020 05:40:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=c+L7KsCOY6qFeiR1Hwd17et+mSRPWVYNWJEy3hpVFbM=;
 b=SBLypchBL85GRawj1DJOrypDZd2hn7wq3yrhCnLFOGCGIsLdbaiPXY8gqlHJrrNOaE
 HHKptclliQpfEE6yvZ7lpHodDylkdBUP7rfgf/oLZ4nxy41P2uDF28DAbQFN0UX8hnM/
 KW1y/LCcgwA0Whffnp/gM1/u28hCK2YaXR+p9C7Qrt57N4bfRU32KynrmPJBRBpFfbqG
 t0DPT8iKAX4eygUHosp07hRWbceWpB3DgJkMHPPKZIU4uN/7kj8W6vc03fnlK6n8H4PT
 RIEzPxFb/xZbDdKadGBLkDWovpxiJ90gpX479tBjwBJ7JW5/6KhZ2qYO+XY8dw4o4Tlx
 Cygw==
X-Gm-Message-State: AOAM532LIKk7ufsUOv54Ye0DXieHj8h+wgxWSIx3aSvCGuIYw8wthB5E
 3wicgOgIyOAEmLXgnxl6ng==
X-Google-Smtp-Source: ABdhPJzYp2gtH1L2laiW+oCQr2gnK/ycYaSVTaTB2Tc9PcJnULV+N/4EBmlZVacWMQE9WtNA3QwS6A==
X-Received: by 2002:a4a:98a3:: with SMTP id a32mr19107834ooj.51.1608039640709; 
 Tue, 15 Dec 2020 05:40:40 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id p4sm5084387oib.24.2020.12.15.05.40.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 05:40:39 -0800 (PST)
Received: (nullmailer pid 3705961 invoked by uid 1000);
 Tue, 15 Dec 2020 13:40:38 -0000
Date: Tue, 15 Dec 2020 07:40:38 -0600
From: Rob Herring <robh@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH RFC v2 1/5] dt-bindings: net: dwmac-meson: use
 picoseconds for the RGMII RX delay
Message-ID: <20201215134038.GA3702703@robh.at.kernel.org>
References: <20201115185210.573739-1-martin.blumenstingl@googlemail.com>
 <20201115185210.573739-2-martin.blumenstingl@googlemail.com>
 <20201207191716.GA647149@robh.at.kernel.org>
 <CAFBinCDXqnPQtu4ZQW2ngxKVSbRQNFbnhy6M04gE+Mc8HOTM8g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFBinCDXqnPQtu4ZQW2ngxKVSbRQNFbnhy6M04gE+Mc8HOTM8g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201215_084042_027355_A11A8899 
X-CRM114-Status: GOOD (  20.56  )
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
Cc: devicetree@vger.kernel.org, f.fainelli@gmail.com, jianxin.pan@amlogic.com,
 Neil Armstrong <narmstrong@baylibre.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew@lunn.ch, khilman@baylibre.com,
 linux-amlogic@lists.infradead.org, kuba@kernel.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org, jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sun, Dec 13, 2020 at 05:59:05PM +0100, Martin Blumenstingl wrote:
> Hi Rob,
> 
> On Mon, Dec 7, 2020 at 8:17 PM Rob Herring <robh@kernel.org> wrote:
> >
> > On Sun, Nov 15, 2020 at 07:52:06PM +0100, Martin Blumenstingl wrote:
> > > Amlogic Meson G12A, G12B and SM1 SoCs have a more advanced RGMII RX
> > > delay register which allows picoseconds precision. Deprecate the old
> > > "amlogic,rx-delay-ns" in favour of a new "amlogic,rgmii-rx-delay-ps"
> > > property.
> > >
> > > For older SoCs the only known supported values were 0ns and 2ns. The new
> > > SoCs have 200ps precision and support RGMII RX delays between 0ps and
> > > 3000ps.
> > >
> > > While here, also update the description of the RX delay to indicate
> > > that:
> > > - with "rgmii" or "rgmii-id" the RX delay should be specified
> > > - with "rgmii-id" or "rgmii-rxid" the RX delay is added by the PHY so
> > >   any configuration on the MAC side is ignored
> > > - with "rmii" the RX delay is not applicable and any configuration is
> > >   ignored
> > >
> > > Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> > > ---
> > >  .../bindings/net/amlogic,meson-dwmac.yaml     | 61 +++++++++++++++++--
> > >  1 file changed, 56 insertions(+), 5 deletions(-)
> >
> > Don't we have common properties for this now?
> I did a quick:
> $ grep -R rx-delay Documentation/devicetree/bindings/net/
> 
> I could find "rx-delay" without vendor prefix, but that's not using
> any unit in the name (ns, ps, ...)
> Please let me know if you aware of any "generic" property for the RX
> delay in picosecond precision

{rx,tx}-internal-delay-ps in ethernet-controller.yaml and 
ethernet-phy.yaml.

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
