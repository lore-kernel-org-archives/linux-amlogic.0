Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA79BC43334
	for <linux-amlogic@archiver.kernel.org>; Sun, 26 Jun 2022 22:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VLn4FyDnMjQZYfcNC4j/YI1frTmho21/KAf527qTZGE=; b=UJjSyr9M1Y9SE9
	RASgMD/pbE+9Fi4Kg2tSTYYqqL/0kIyoHt1C2gh0WFHG3yadHEwcQqyePFHvV1gJLEIpwZYUWIva+
	GEstCYcSEp1VbgpRIVhPWQtUEKKuIsEOFTh3eoVUL3QcKbgAQ4bV6S0IpaO36Sb46QhbVOAKmfdzH
	ov9/D/iUgTlmMGYU34ASlplli67A+3dulpJH1mTOuLTs+HidkzReAIolFPb1I6xRd50+gqs319p5/
	dfdFddmjaqkHC2C/+3goaB43tMc+x7h8/WPQ4R4JEitNk+BI1miwI3dYzwVLSFr3xTe66jEhFZ/2H
	ocxWB17MIDlCxZ0x1ddA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5aNT-00Dm9e-Sc; Sun, 26 Jun 2022 22:05:11 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5aNI-00Dm4Z-GK; Sun, 26 Jun 2022 22:05:01 +0000
Received: by mail-ej1-x633.google.com with SMTP id ge10so15310580ejb.7;
        Sun, 26 Jun 2022 15:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=//8qIPvD9fx4vnZ4OSbBjfyuVaCRmOPsAXW5FiUJReQ=;
        b=jEraMw5PgXBCR7yp4ZGMgltpgL1elV+jITZQson/py3EPfMsd2X5TrA2QPgnJPv0rY
         f7IquTtHCzIXMebOMKGuiKQj6yVaycJgQf2drQ/kH5WKXm9J/a+pka+SF2oACxKQmRUs
         at+93CqKlgK+x2AYa2S/rEz+qkcK4CNRHCTcmRMbigk+VCQ3rBMvZYcRmON5DC8XYfEz
         7PoM+82USCDfRFaKPii1BdKHS+PYtlSFI3ta6fPvIViMpMQ4100hT6qoKVHBp3gHQKnE
         PAbmufiBBhuXvMCx0PZtSYKNFZ4o6ZEyI1kdu9p8k9PIzFLztZV/Upz0w6TbZKygjYq/
         31mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=//8qIPvD9fx4vnZ4OSbBjfyuVaCRmOPsAXW5FiUJReQ=;
        b=ZQNIpEwS12CAhM/LKkJ0/6W06y5ML/X5Fb12yiWvh0uLzEWc4YwUelEYw2Jlf8VIuN
         ko419hOcZnxQTItDalb1IF10H4xlHoTAb/tMh8SW2B9xksuPrK6RYzpiE+fQOizt6d3D
         3AihqWl16aEvqesI1seWZztRAWKSqipGGQL93K6MGnjguUQuzMHGT5nxmoEf0Hpd4fpr
         DdOZFPxWSwQmLHdA750atGR8P4Nxc3FBTlUPbivi4H44AOLswFxUcXkGBHa0UOAEekgz
         umF60n+jGJM/6BszAJrH/9TTkCxhnnd0Taa3o3M/aItwTP3Rkup02Ix/NVBqZessBdtu
         pvEg==
X-Gm-Message-State: AJIora8LzPVLaBHpfE7VOS06oEZVqPecUiOkK7fqNw0UXYDZYuhuPr4a
	cyiNUgZNXfg3rL57p6zFHfoIdWoH0yU9X92F7LQ=
X-Google-Smtp-Source: AGRyM1sDEv/jauZf3Ot7PeMro4bmWPVUVrYNZA8AJKG4J8ZwjfHGooE37UqV9ZbFkwGQtylIuyjnSjTtF1XAsiOnc9I=
X-Received: by 2002:a17:906:3f51:b0:712:3945:8c0d with SMTP id
 f17-20020a1709063f5100b0071239458c0dmr9649843ejj.302.1656281098352; Sun, 26
 Jun 2022 15:04:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220621120015.113682-1-jiangjian@cdjrlc.com>
In-Reply-To: <20220621120015.113682-1-jiangjian@cdjrlc.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Mon, 27 Jun 2022 00:04:47 +0200
Message-ID: <CAFBinCANyt6+_wJ6dwr2xY53vn=hSU7ZQE_y79+MwYbTiUOzHA@mail.gmail.com>
Subject: Re: [PATCH] phy: dphy: drop unexpected word "the" in the comments
To: Jiang Jian <jiangjian@cdjrlc.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, khilman@baylibre.com, kishon@ti.com, 
	vkoul@kernel.org, jbrunet@baylibre.com, victor.liu@nxp.com, 
	andrzej.hajda@intel.com, linux-phy@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220626_150500_774637_5936B418 
X-CRM114-Status: UNSURE (   8.89  )
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

On Tue, Jun 21, 2022 at 2:01 PM Jiang Jian <jiangjian@cdjrlc.com> wrote:
>
> there is an unexpected word "the" in the comments that need to be dropped
>
> file: ./drivers/phy/amlogic/phy-meson-axg-mipi-dphy.c
> line: 139
> * when in RxULPS check state, after the the logic enable the analog,
> changed to
> * when in RxULPS check state, after the logic enable the analog,
>
> Signed-off-by: Jiang Jian <jiangjian@cdjrlc.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
