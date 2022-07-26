Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB842C00144
	for <linux-amlogic@archiver.kernel.org>; Tue, 26 Jul 2022 21:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pfPfNBQMkvos/dzepOcGpjoP9+T1wM7k83Pkk2PqMRY=; b=tizU5PNcXLJsWe
	ytbpMi60z+cfh+74AvJ8K87XB+kO2CEasKTRvS048LBHvr37kKLIj6bkKnI2ZGVHrIppZ1eaAncVa
	JAQ+T6r4aFoltNy3vxuoDj9BYKwBl54VQwFsvBq/UqBpuS47/sOAgj4OCMYLF5QSNKPDTrzwfzIFU
	G4YbuWrjRkcUWebeoCyEs0AFOg2HpxCk2UZCvCyqU7L2Y3RXcu5qGnIyI2boL3k1QA+pC9OyMFdGH
	J3xuhfovnizqp5AXacAY4ZM3dMjfda/IRG420xqn2YgB8TzQL/Zxkaj6FCIp9V148eq5+1g6P4WQC
	WFH1TR9RsnSpzjTLUzFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGRrk-003q9Y-N8; Tue, 26 Jul 2022 21:13:20 +0000
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGRrX-003phK-TT; Tue, 26 Jul 2022 21:13:09 +0000
Received: by mail-yb1-xb31.google.com with SMTP id 123so4501674ybv.7;
        Tue, 26 Jul 2022 14:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jCtvYRpEMBCPzbyROGoyYf0lRNeV9Dra1FQHvnx7jnM=;
        b=U9Bw0WfYmR91vaSMsBJwo8Zy2fZhVbN3FBnDt5UgLf8SxYoxbd+VFXP4Tywj02Y5XK
         qcDkB6JneSzk2jmHhz6QjydwhKgn3HS68lU9ktuANbYkIOV7hENe8GnkD/pACV2UQHtj
         D36SrtJU7ZCqCmmAtkZVjq3puyc/iDWQst/0h7GncLTGJfcUB2j4cdEWMN3M8oulHjp/
         sOdnyLYI2XjdSvqNtizxQzps74fqfnpymGf3R3DJWVTql05xkJgNzluntX1TSODbiZGn
         vvE+UM3ybaMZQ+CyaN4+hRuN0qxyMpkjkovAI9e2BIhCQy5PbNu9JBDu73d8UdE7vQNQ
         spQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jCtvYRpEMBCPzbyROGoyYf0lRNeV9Dra1FQHvnx7jnM=;
        b=o8tRrgUte4dFBhSFWeF+6zwo6WSL45h6N2L1oM8ZLydWyW0Odoj1XwY2HaVkVQSX3+
         P+ljbaF526s9ATxu78AcEpi3jIDyWIzOKf9HQ1D4RhGysiE3vUxBSVoBdvK26DivpEcx
         neaO3If+lsDbJzXWPNnzdpIbv3kY2Q+uw0M0sLeWNC0fzLLAvRx6QfCU9oMwy8K1FtwB
         UiQ+RrXdnt5Mh6siTL7UZDEf92xHyXLarJifGN4vihcn3fHzQpCabppmfbQG7+OAPONx
         kLQtKGdsVx+BDnHxMzXehle0NKoICsf1t3GZPKzK3gQSnNZ8+tn7Cp3ENObG6tJGMw6m
         3kVA==
X-Gm-Message-State: AJIora+LM0ydmVz1kUBMMHK4IGrLvLw6DzHqMd/Orfz5oWV7gMXJRJy5
	Un/BDhm26/d8wCjQJhyA6u4VrLg2AHQr4RhCSBJif7i96gg=
X-Google-Smtp-Source: AGRyM1v+niVa1+h0cDd+4Kkox5/WVMHXA6WNpsGRPulm/gd0pluysjA90pVOK2gCuAnGLsqdtPjuu+HaHUfJmNfiWC0=
X-Received: by 2002:a05:6902:114d:b0:66d:9fa6:4bd4 with SMTP id
 p13-20020a056902114d00b0066d9fa64bd4mr14376993ybu.362.1658869969098; Tue, 26
 Jul 2022 14:12:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220726073841.1320509-1-windhl@126.com>
In-Reply-To: <20220726073841.1320509-1-windhl@126.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 26 Jul 2022 23:12:38 +0200
Message-ID: <CAFBinCB8=m=+F5C=QKKbHDDHDKM1JqZgNB8GZ=fgk2h5ti_rCA@mail.gmail.com>
Subject: Re: [PATCH v2] soc: amlogic: meson-pwrc: Hold reference returned by of_get_parent()
To: Liang He <windhl@126.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, khilman@baylibre.com, jbrunet@baylibre.com, 
	p.zabel@pengutronix.de, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_141307_981012_087A9936 
X-CRM114-Status: UNSURE (   7.95  )
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

On Tue, Jul 26, 2022 at 9:39 AM Liang He <windhl@126.com> wrote:
>
> We should hold the reference returned by of_get_parent() and use
> it to call of_node_put() for refcount balance.
>
> Signed-off-by: Liang He <windhl@126.com>
Thank you for the update in v2! This now gets my:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
