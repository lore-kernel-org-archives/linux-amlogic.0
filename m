Return-Path: <SRS0=vX07=5U=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FF53C4332B
	for <linux-amlogic@archiver.kernel.org>; Sat,  4 Apr 2020 17:21:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 47491206E6
	for <linux-amlogic@archiver.kernel.org>; Sat,  4 Apr 2020 17:21:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="P/jXKpgi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 47491206E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VYere7fDqtPebaZNMSVTT6Wxf7fOPp4M+dN2NvEjM5g=; b=P/jXKpgivtLYuR
	m3CtsDorIBm/Y1xmeLso+qe1xF0RBJizAdfxNknfk0yY1/IvoZchHLvSORhhC8JgzkAmntSZvXCtB
	qbtvQ4BtyedMY5uqFiq3hrEtYSMCpTTsFQNiLuc/Pd4X2CIjC2LPM7Q13y+iK8YitOAEpgM3SXFHK
	kVPLIIDTEtfOkEARs3Y4gX8vSE8lEKs8xDkFRHsSUDP1APOtU/LVYiyAniMOWVMziRI3Ymj5/3aIL
	7GSwjoz+/3oGavl+XGndOx43Ix7T/5k/Ad6w3SkHV8UafX9MTX/gvOzzKCOayE0+KpPgRoPHY0eHm
	TfsYRLW39+f0a1I8FjVQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jKmU9-0000mW-3B; Sat, 04 Apr 2020 17:21:33 +0000
Received: from mail-il1-f196.google.com ([209.85.166.196])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jKmU0-0000bm-At; Sat, 04 Apr 2020 17:21:25 +0000
Received: by mail-il1-f196.google.com with SMTP id p13so10579561ilp.3;
 Sat, 04 Apr 2020 10:21:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=1n2uOR6wFgUHEXtF3w9/WEH6BH4ieKdqJajPzMFObBI=;
 b=J7ap7ZWJGa57p1cIecOJ4tdNApOIOlfEWwRTXuDTZe1R7ZDhHalSOoQUX70lyykjAG
 UuO8Wh+auhcxnIM8Rrs5Fi7t6HHfDZPTtgNattQn8h/glAqnoVjSEy3q9ZK197Hjz7bf
 Hr6pDuMZtUI02oHYgqIzXUI9e3eZUA8wd8cP9ZmsfYvLnB0kvrMnfLHE2Io1MGNB/VVG
 5e5Ndm2+UJi9xogNk33655ZkD6XEbfa3HeMM5zxRrqSyBdBQ8ymmoifwh4RpxO0pRFVZ
 CLQK2rxYZcKf6CkeUWvIpgd+VfV9gEg7NMWQMe3Mvg6pPZmZQsmvMnVFl8T5XcKwkECs
 bqZw==
X-Gm-Message-State: AGi0PuZ2BxYD5o8QuoQHg4XafhZNf93EenQBhvEbxY0ZY/XqMDTpCw2y
 KNg1GfE+z3eAse/w4MNlQg==
X-Google-Smtp-Source: APiQypJQmZoJcNGxvGUS5ebio90Mu9iNzLO0TNKqrWWw6ta7vdiuT/lWFRwb1TqO2AyRYUyPJGlFvg==
X-Received: by 2002:a92:881b:: with SMTP id h27mr14581682ild.262.1586020882799; 
 Sat, 04 Apr 2020 10:21:22 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id j84sm4091586ili.65.2020.04.04.10.21.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Apr 2020 10:21:22 -0700 (PDT)
Received: (nullmailer pid 28438 invoked by uid 1000);
 Sat, 04 Apr 2020 17:21:20 -0000
Date: Sat, 4 Apr 2020 11:21:20 -0600
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v2 14/14] dt-bindings: usb: dwc3: remove old DWC3 wrapper
Message-ID: <20200404172120.GA28402@bogus>
References: <20200326134507.4808-1-narmstrong@baylibre.com>
 <20200326134507.4808-15-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200326134507.4808-15-narmstrong@baylibre.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200404_102124_548072_6FED4FBF 
X-CRM114-Status: UNSURE (   8.81  )
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
Cc: balbi@kernel.org, devicetree@vger.kernel.org,
 martin.blumenstingl@googlemail.com, khilman@baylibre.com,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, kishon@ti.com,
 Neil Armstrong <narmstrong@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, 26 Mar 2020 14:45:06 +0100, Neil Armstrong wrote:
> From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> 
> There is now an updated bindings for these SoCs making the old
> compatible obsolete.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  .../devicetree/bindings/usb/amlogic,dwc3.txt  | 42 -------------------
>  1 file changed, 42 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/usb/amlogic,dwc3.txt
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
