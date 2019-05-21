Return-Path: <SRS0=vjLk=TV=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 008ECC04AAF
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 May 2019 15:26:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9BC12173C
	for <linux-amlogic@archiver.kernel.org>; Tue, 21 May 2019 15:26:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="a8/Ciu3H";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="LPan0Ooq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C9BC12173C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WyjqL9H0wPVdALSAWckUn6dw5ih1Bhmu9vzI743hSuU=; b=a8/Ciu3HuwDde2
	sDEIexCOQf4ECY/hN+XVSQqs+Am3D/bXC66Djd2nK8yXFpVmDG1uQqsAla2R7Z+81rxluZaXhzmjS
	Ax9XDSc+k+at3c5hBTpop88VOcTu8B+tXrq7llNK1n3pOozduOQ3o5JDlIUT3OCH5LoaxoBBTMq+S
	ljLJ6RrkuW0I+ZFiGX27Mvl+Td1msmo6LuuljLHQVarGb4vf4oprOmb3A3b5awgGJO8PiH27s2MOy
	rAzlhjBJMQVg9gfqiAbT12sHWRSEQlc0gkYYFOsw/P8WcjHmXHLDxEccJEDOvtO5+6LVeWR4SWUAd
	mmPWHb2bnZivZvpob++w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hT6en-0001cs-2D; Tue, 21 May 2019 15:26:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hT6el-0001cN-4z; Tue, 21 May 2019 15:26:24 +0000
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com
 [209.85.160.174])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6EEA0217D8;
 Tue, 21 May 2019 15:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558452382;
 bh=iGkz6BZGfgnVMTNR7D6Gc8n2oafP2tlbN+gEg58SOgA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=LPan0OoquxfP+CI0zX4dxS2darinFP/btGENU/v8B2Rt3/kZQFsqph4g3Q0igIdy+
 xKknddwpqzrAd9v53nL3AbU9x65g3z0Oo3zHWAg+EvpuOz4KO5Kc7bVYa7qdOtPYho
 QuY98ftLY+1E/kbdehw3VW0UHwI3DJ7LBbOvczMg=
Received: by mail-qt1-f174.google.com with SMTP id m32so21005678qtf.0;
 Tue, 21 May 2019 08:26:22 -0700 (PDT)
X-Gm-Message-State: APjAAAUR55NgisBIdnyxbs0ICg3ub6N9678pfdMbu76UKyu+NeqHtDZH
 UtqCpifvhqmj4njx1Dk95rIMShPyLxt7LMxUTg==
X-Google-Smtp-Source: APXvYqzQZSno9wojPimJguFsCsD2Brx/RDShSi4VwGE71wQY9X3Mjw8GOQUDteEXyxgmqI5nEQ6JJxGYVo0v+anUMmU=
X-Received: by 2002:aed:3f5b:: with SMTP id q27mr68089866qtf.143.1558452381663; 
 Tue, 21 May 2019 08:26:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190521151952.2779-1-narmstrong@baylibre.com>
 <20190521151952.2779-3-narmstrong@baylibre.com>
In-Reply-To: <20190521151952.2779-3-narmstrong@baylibre.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 21 May 2019 10:26:10 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+am_5q5ApjEo7bVXWsqEaZH-1kbqGVS51-O+p1poFLsQ@mail.gmail.com>
Message-ID: <CAL_Jsq+am_5q5ApjEo7bVXWsqEaZH-1kbqGVS51-O+p1poFLsQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: arm: amlogic: add Odroid-N2 binding
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190521_082623_205448_7864EFFF 
X-CRM114-Status: UNSURE (   9.77  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Kevin Hilman <khilman@baylibre.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-amlogic@lists.infradead.org,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Tue, May 21, 2019 at 10:19 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Add compatible for the Amlogic G12B (S922X) SoC based Odroid-N2 SBC
> from HardKernel.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
> Rob, Martin,
>
> I converted the patch you acked in yaml, I kept the Reviewed-by,
> is it ok for you ?

Yes, both look fine.

Rob

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
