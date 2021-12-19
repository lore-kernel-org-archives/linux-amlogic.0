Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 951EAC433F5
	for <linux-amlogic@archiver.kernel.org>; Sun, 19 Dec 2021 15:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Frwq6OjmZC3s3UF4WfL7h4urkkvnz1mF8TVo32gsuHk=; b=fi3DNbcUK3Rptb
	rxm4vPFn2Fv1R87jxZOVzXJ1WVQ8jDEEJJ1RBYKP+3fFGAjoXxxn7V/VU8Pwue4Hqp2dlRlurWMOI
	0N6JRDMGWTm+dGIRmOERpPhrCI2Tbo09J+w7vIg9LHtRUXPT8J1nBHMd62nrS92tGC/VrPfYC2par
	jZoRzx07btFcBTbFvPL3pK3ou/hPcSQKZTnJGMO2/KUTivDqlSnyTQ06eKqZ95Yjlqn6zKB8zA3Pn
	WvwGuN1h45fpCCoiFqvuIlcJ75XkaWm1oejVE8PHPvuHj6D5LEgUSEecGRnbqttRHD/QCMH34mD3y
	/CGp1Sktu0fq8NE3Qh+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myy9F-00GEO9-Ml; Sun, 19 Dec 2021 15:30:53 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myy9C-00GENd-LC
 for linux-amlogic@lists.infradead.org; Sun, 19 Dec 2021 15:30:51 +0000
Received: by mail-ed1-x52d.google.com with SMTP id z5so28357850edd.3
 for <linux-amlogic@lists.infradead.org>; Sun, 19 Dec 2021 07:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3NR4neBcSa3OVf9zcTRr891OJW6GQ6/iIdu+6NzYN1M=;
 b=oh2W14TdHR2oEhC1XcD0jG913YSk88gaA6ikIJ2a7HXceu11eZnJZfas36H88DO8YZ
 8Zj9FMjGbVsPZSihV4MFWO1EgAwVgwt3DHtannbEc7qA/SrGWJiSkFMTZSph2usLkXV6
 xz8EIqP9krRxAKrWAITL/54K6b3Vrx2BH4ug/iowgxyX6+VmsqchukIdyXAkfYTWYOE7
 4Q1MQTEVsIZomQf9DaKxubb1FFqyACsCDZwA1DidfHkJuGpnpanRgY3Nf4K/2NwI8ESb
 JNW5hhEbzTqw9FzAkRcbpqtFZKovNZGqKN3C+dFY4DNE6VDrAYe7BBmmDI2Ih7B8MvZr
 AUAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3NR4neBcSa3OVf9zcTRr891OJW6GQ6/iIdu+6NzYN1M=;
 b=ZB4+HWV6zggF1dy3io0Bz5mlGo01JoQre+TfLgHF3VlPWRCOI6BbFNdTWvVoUHv10h
 PLW3pTR5CPSPn2RPAOkDarVrgSq++BdRuSK29RFOoVLQWXf2Gn4KBFT6o87/tmUxn1Z1
 RxtnrX75zK9LH4N2obDs2RdJ0iHaXY5LrsRVONTVNzlH2R4M+1E4Ql6lBVb2a23HCvxL
 /CVmDGcORT6FpfkXPnFqrImYKEZTHGtqalFaqrzHugCAqjJCQDW4Ojhw5XYBz1+3eMO2
 J6KxJPcx+FCvQqblPQ2tUwdAiurVET1bYzRrzoQvDN/21ekFRTunRbBa9BC66k1n0BB0
 C6/Q==
X-Gm-Message-State: AOAM531ZCiJkGjitPTYW9ndMIgrP4GyMHhpJL1O3lNtUCxekm3IXPhAX
 q6tE7bUPtqwYjKsB9rBUNHGtq5Qg3rD5MKJzZhc=
X-Google-Smtp-Source: ABdhPJxf2/ofkyCTtyEKzMzBnoQiLt7GKIc7vbKI/YJnZJRORsBun1XfTBIuVsS5iWJPwmINtrivWq7dPxnfil2wzLw=
X-Received: by 2002:a17:907:c0c:: with SMTP id
 ga12mr7783351ejc.147.1639927849041; 
 Sun, 19 Dec 2021 07:30:49 -0800 (PST)
MIME-Version: 1.0
References: <20211219094155.177206-1-alexander.stein@mailbox.org>
In-Reply-To: <20211219094155.177206-1-alexander.stein@mailbox.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 19 Dec 2021 16:30:38 +0100
Message-ID: <CAFBinCBNqbu-jftGbt9Ss8KPkv+p48295MX5QBsJbc=yneqa8w@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] dt-bindings: display: meson-vpu: Add missing
 amlogic,canvas property
To: Alexander Stein <alexander.stein@mailbox.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211219_073050_760765_112FC863 
X-CRM114-Status: UNSURE (   8.80  )
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

On Sun, Dec 19, 2021 at 10:42 AM Alexander Stein
<alexander.stein@mailbox.org> wrote:
>
> This property was already mentioned in the old textual bindings
> amlogic,meson-vpu.txt, but got dropped during conversion.
> Adding it back similar to amlogic,gx-vdec.yaml.
>
> Fixes: 6b9ebf1e0e67 ("dt-bindings: display: amlogic, meson-vpu: convert to yaml")
> Signed-off-by: Alexander Stein <alexander.stein@mailbox.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Thank you very much for this contribution!

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
