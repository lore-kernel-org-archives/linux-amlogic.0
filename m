Return-Path: <SRS0=7wMv=6U=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43251C38A24
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 May 2020 20:08:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 144CF2070B
	for <linux-amlogic@archiver.kernel.org>; Wed,  6 May 2020 20:08:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Tlm74+zi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 144CF2070B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rp8GZnNOkqwP5sQYqKgFkL4Cwcy1Yb5DB7TsrLoiXdE=; b=Tlm74+ziaSUa32
	pc1fB/sG+h4DQq7dVCA5yK39ir1eIBnhCO9/F1OthjbhwolQ0KbYNn01esLiNUulC9zdp3Y33gSjA
	8+dtLn9B9vc59z5c4zqUvcxGsOfg5arfN4fs6mMmx6MpBtWo6YpILVCDZ2eqRjzEPjwn9p5ckfB08
	K8GgjQVhFGIIUFXooxXC837zGP+a65kvOg/Mg9Z+E8q1oChbatZreLPXctNzovCNywC7WsUB/QEsk
	+TWhRgOUy0l7hxdsJrvHXpRzX7/fQfrSv8c1KVQUZq1rBvpkzgUl2zcXj14JcDxSFvXMp8vgrwFV4
	XPtn+ZUXMKX8SMS9gqHA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWQKf-0000Rg-Vm; Wed, 06 May 2020 20:07:53 +0000
Received: from mail-oo1-f66.google.com ([209.85.161.66])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWQKd-0000R0-Q8; Wed, 06 May 2020 20:07:53 +0000
Received: by mail-oo1-f66.google.com with SMTP id x17so785855ooa.3;
 Wed, 06 May 2020 13:07:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=m//K22Duhst7MLLBowkL8H7YWW4DvGlsi4f3I8y8i0A=;
 b=ei5iG9UiIvxyTJPzJQOIcLyhkGLVpvDcPcn8xp+Jr4FLwG/mzCWhneoK1HjGbpjZNe
 rPH5r0fN67FS2nr7Giv8Dusm+8+CPovQUngBCeH3xN85TCebb2fbQAEm5WoTyRqoaM+e
 vZNGotdZhINhr/ZgSQIHWstyHZnI2e/4+D9hoJa1GVNYGS6z4LIZ3LqlZfkTky3Ec//u
 f2RidXQ2a0VbJbgn5dpmo8rPwIHMcQSBXuT088+Iu+vmewZHCbZBAXSrgpF09Iu326fd
 LzH/+IgZBphNBalrBnehVKH02Go82HWzAXxQmyZ6pu9m9n2Lupxa0RNR7GHqoNt9nLcQ
 mA9g==
X-Gm-Message-State: AGi0PubXBUwt6UeXbMzA+if/tyIpejSNtS46aJtxEN6g3FQkcnP+vm/j
 feOZUJJvQSojqSMQbdFNAA==
X-Google-Smtp-Source: APiQypJG0GZkVXMMvIH0qOJ1vVRwc8oBzdFTSXt7YgCtCveVNkr6Z5mZ06vR2w6MBzufhOQoVl9k6g==
X-Received: by 2002:a4a:1445:: with SMTP id 66mr8623663ood.87.1588795670622;
 Wed, 06 May 2020 13:07:50 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id m11sm747801otr.79.2020.05.06.13.07.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 May 2020 13:07:50 -0700 (PDT)
Received: (nullmailer pid 1918 invoked by uid 1000);
 Wed, 06 May 2020 20:07:49 -0000
Date: Wed, 6 May 2020 15:07:49 -0500
From: Rob Herring <robh@kernel.org>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH v3 2/4] dt-bindings: power: meson-ee-pwrc: add support
 for the  Meson GX SoCs
Message-ID: <20200506200749.GA1868@bogus>
References: <20200420202612.369370-1-martin.blumenstingl@googlemail.com>
 <20200420202612.369370-3-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200420202612.369370-3-martin.blumenstingl@googlemail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200506_130751_852021_016D1C94 
X-CRM114-Status: GOOD (  10.85  )
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
Cc: devicetree@vger.kernel.org, narmstrong@baylibre.com,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, 20 Apr 2020 22:26:10 +0200, Martin Blumenstingl wrote:
> The power domains on the GX SoCs are very similar to G12A. The only
> known differences so far are:
> - The GX SoCs do not have the HHI_VPU_MEM_PD_REG2 register (for the
>   VPU power-domain)
> - The GX SoCs have an additional reset line called "dvin"
> 
> Add a new compatible string and adjust the reset line expectations for
> these SoCs.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  .../bindings/power/amlogic,meson-ee-pwrc.yaml | 28 +++++++++++++++++++
>  include/dt-bindings/power/meson-gxbb-power.h  | 13 +++++++++
>  2 files changed, 41 insertions(+)
>  create mode 100644 include/dt-bindings/power/meson-gxbb-power.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
