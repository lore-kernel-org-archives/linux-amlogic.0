Return-Path: <SRS0=LWkI=U7=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB56CC5B57D
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Jul 2019 23:11:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 834BF21993
	for <linux-amlogic@archiver.kernel.org>; Tue,  2 Jul 2019 23:11:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hNf9U5dT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="m1ZfnGZP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 834BF21993
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BLBV/G8Qdqbd8/P5dzoxBx9jJEmd6cbXv593QL61byQ=; b=hNf9U5dTLNVoXb
	ytlvnJI/HEAdvGooIHw4div9tINT1+xCqYUazwiFvFuJaZOFgc03nXO1W9fPXSJ4qhPRIRwlJeDwn
	MTTVibvlncANyFjx4se8zFcVr04/t1wTYe9q0DDBwoh4+8bi7N1IJZoM1a3iHJTmIbxBAyYyXaNt7
	jh/bpN0jaUpj6m5AN+/QRHetxvr072/NbVHnotbIvDKdEShQdKwUXPsmJIncBXIids5QQYprAZtJz
	0ZX/oodrxgfSgowScS/L5cwstoGJ2fFNUx43zJHu0zN/DlzcefFTuBbQkfk65SnteJzTB6IGuoctb
	OX2vXCgyGvHTuP4E+73w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hiRvt-0007xL-SQ; Tue, 02 Jul 2019 23:11:29 +0000
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hiRvr-0007wz-GA; Tue, 02 Jul 2019 23:11:28 +0000
Received: by mail-oi1-x244.google.com with SMTP id w196so419908oie.7;
 Tue, 02 Jul 2019 16:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q/LR59K4n2NpGvRZpSrMlExpZ6t8aHVL7QCUI5shco4=;
 b=m1ZfnGZP2wao1pfpBciR9QVwvmICdJ4yeAKJXaIVlcbimy7/OKpd3vAuPRVC6fvrAG
 Paaxs7nDaOQNrJgGk7bBlPbHF+/HooMpT2EWnQNFYZB94nf22g9mzCW3WBfffmhVou31
 C5ykE+MxpfB1QOBe1uGXl/YOyvVK745m30pJjkvik5NuAPVWzyOhLo8gnGGmZDOGW457
 Qby0QbhvCNuhSBup7IbkPzlH0CjTLxDJpqyVgkHVAZFxTRoULwm9DgYqR7HeN947HMWy
 qzlPlUb35ILttMlYn2dxCyVk3Cn++LxqAFBTfpYIBsBlU3bYd7fGzie/v87dWe474olr
 j3bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q/LR59K4n2NpGvRZpSrMlExpZ6t8aHVL7QCUI5shco4=;
 b=BznRdRMeZS1OdAm+4OUcDC0RT/ePzHKmQ49SlPj35COrfpFhie7XFJ+P8NM4x+Ilbd
 jq7OEwIhoFMDYHS6jMsnIHo1fQwP3Jab8nl0TEj14jn/g3C7h2BfHtTz+SZAhUE7F4z0
 HPb1fI3gGXI4Fqg+Kv5gdyonDMmjzBhAf/44AaAfpW6l+eNsXBjwHy3YaVzuhAZRyaJl
 eBBn5LlP0xJe9uQeWSrmA4aPd1YrR5KRlxIqfSuUNVSQNJ1CkkySGwd3laZMwZxW8pLz
 UCFCt/2aBrAROyFB0xJhv8Z2Qe91JyWobPiM+NIH7dosmeaPbZ+QCQbZ4JbIz9Dru6pE
 HTng==
X-Gm-Message-State: APjAAAURpsa7ZfF3QV/0OnML9c6Z7KKhT0gvtnbq2MH1oP3xF9IlvUb0
 aiRIgDH2wpIlZVbOMt/42+eKXq7axupE0nY8eapBN7TW
X-Google-Smtp-Source: APXvYqztWhmeaDg8T3K0pmGU/qZhQ+fCAj/s1HnyoXH6d4sZovOx7CJ19m/uyyQ3H8w+wL38c17urJw0X9Mw0cHLFag=
X-Received: by 2002:aca:4ad2:: with SMTP id x201mr4620515oia.129.1562109086426; 
 Tue, 02 Jul 2019 16:11:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190701104705.18271-1-narmstrong@baylibre.com>
 <20190701104705.18271-2-narmstrong@baylibre.com>
In-Reply-To: <20190701104705.18271-2-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Wed, 3 Jul 2019 01:11:15 +0200
Message-ID: <CAFBinCA5iZDanZ5f=y_J3PH-2bXOfKfjQDP9hiz1RSmKszMRPQ@mail.gmail.com>
Subject: Re: [RFC 01/11] soc: amlogic: meson-gx-socinfo: Add SM1 and S905X3 IDs
To: Neil Armstrong <narmstrong@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190702_161127_560461_33C92C17 
X-CRM114-Status: UNSURE (   5.79  )
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
Cc: khilman@baylibre.com, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Mon, Jul 1, 2019 at 12:48 PM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> Add the SoC IDs for the S905X3 Amlogic SM1 SoC.
>
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
