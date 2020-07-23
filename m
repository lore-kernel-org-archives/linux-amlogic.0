Return-Path: <SRS0=T680=BC=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96504C433E5
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Jul 2020 21:10:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 615652067D
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 Jul 2020 21:10:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VcpEqWaP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 615652067D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/GpuiFfQO7prT9VN1/S8E5BT/LGU+XPjtQ6vbNfCAgY=; b=VcpEqWaPosCcN6oJwVpmEiLow
	kP3dKcRzAjqrJqzPtZ/GdG3LZ6ukXEZnBBAbQs45/lS7A4/W493qZZJmWgN3ZqjsTKbR9iyc/xH+T
	Lg0dVbLxgTc+vMuD7IQ55rt9uzCT47sjtz8vl0tHXHJoCwqIXa+6U2W/5WgDnHgbx8N7XO48qBjj8
	Hbis1rKtidTzC6w1tYunEA0nRuzQPQstLDouNIBdOLbi/hue+6+iK0OKCP2FWQgYuc2rCqe3vL12P
	afaEnQv63ElsA58hiTVbpi+O4MMjh6vytlk+80PCWjdoRy7DI9zQMKHEgbdukXZ1D+csncUC+467p
	0rDiLZA0A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyiUI-0001sH-A4; Thu, 23 Jul 2020 21:10:46 +0000
Received: from mail-io1-f68.google.com ([209.85.166.68])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyiUG-0001re-58; Thu, 23 Jul 2020 21:10:44 +0000
Received: by mail-io1-f68.google.com with SMTP id v6so7784808iob.4;
 Thu, 23 Jul 2020 14:10:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rFnG6OjqqnnpckoLrF3IZeXaDva71gf7e2ghfJANXJg=;
 b=msQ5p6/Ae032Mgznv57EgLYnN/kRjnEultU3YAUvKjvjDEW3it4qR859eL96x90YpB
 BwIDO1c0dYf6WOEsaC/EHQrh+yPR60negbrVsEHMOj3a878iAZgl04xZg84nK6D4PBl4
 pA68lh24Iq5bk+p98RP4CDd0loo6gjxS7fb551KiNRW+uWZ91f1lY3NYvW7Fi2NwUkQJ
 RvA37BDD7eyVB3+acGKIhUGRLr+L1rwEc/S52/dBqlxP+OUMW25/7+Uxx6mTXWE2zoJE
 mZ1bLDaiyEMMASA2tcEyUtMRTuAyl1wqhzQ+MpkKV+V4urm+hoilks7uMhZJxodUenJL
 4BTw==
X-Gm-Message-State: AOAM533KwjFp5/Jw2xvug+g4FTem4mjal0SyggGLca1MSVe0j6BOgkS6
 jRgBJnE8IHbqqxLv4Gtogg==
X-Google-Smtp-Source: ABdhPJzPkVpagcW3ivBb3LUe2ly7ZSWK85Q3R+Kf30ArUVlbxiQmo8M85lxbkm/bp9JvXSVnb1L/Jw==
X-Received: by 2002:a6b:4f19:: with SMTP id d25mr233891iob.190.1595538642326; 
 Thu, 23 Jul 2020 14:10:42 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
 by smtp.gmail.com with ESMTPSA id d6sm2086764ioo.9.2020.07.23.14.10.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 14:10:41 -0700 (PDT)
Received: (nullmailer pid 864810 invoked by uid 1000);
 Thu, 23 Jul 2020 21:10:40 -0000
Date: Thu, 23 Jul 2020 15:10:40 -0600
From: Rob Herring <robh@kernel.org>
To: Christian Hewitt <christianshewitt@gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: arm: amlogic: add support for the
 ODROID-N2+
Message-ID: <20200723211040.GA864520@bogus>
References: <20200719141034.8403-1-christianshewitt@gmail.com>
 <20200719141034.8403-3-christianshewitt@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200719141034.8403-3-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_171044_213853_C8767C99 
X-CRM114-Status: UNSURE (   9.60  )
X-CRM114-Notice: Please train this message.
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Kevin Hilman <khilman@baylibre.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Dongjin Kim <tobetter@hardkernel.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Sun, 19 Jul 2020 14:10:33 +0000, Christian Hewitt wrote:
> HardKernel ODROID-N2+ uses a revised Amlogic S922X v2 chip that supports
> higher cpu clock speeds than the original ODROID-N2.
> 
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/amlogic.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
