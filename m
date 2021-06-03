Return-Path: <SRS0=VErV=K5=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC7FDC47096
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Jun 2021 18:03:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 856EA611ED
	for <linux-amlogic@archiver.kernel.org>; Thu,  3 Jun 2021 18:03:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 856EA611ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=so/QCtJ6FbgEhKaxWIrlaxMENv3dwup/ONs/RxWLrJs=; b=L7KwfJmDzUermQ
	0SPxhsiOFepAVc8uE3tY7C9CRonE8uIK4jOW1BjdP8l3MA+hfVw5RNOSFYKRjfPm/Id/4EALFEJSt
	vemLUDsyEFKuR1sFkz6HhJfeHksQukeaEl7SLzUP7YDCUgU+mTKP4/ZDxt+2lcoGIuwXsGtG8BgFo
	wNjbPE5W8kabQfp+/IFOW8a/pc1mvpMvFPsqHzrE6CEDjB/zRBKoJbyVbCwu7s6K1vwv8zWuiO+ba
	Y+a52AHXMLu6Fca5/G/ai5mc5CzqqdVN+CMLdu4PXfEwnncnVVMiXEB4YxmISGObqeiltN1dOKh02
	yV+ujhf8LZ01MrvUfp8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lorgg-00A0jD-VC; Thu, 03 Jun 2021 18:03:22 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lorgc-00A0ih-Ti; Thu, 03 Jun 2021 18:03:21 +0000
Received: by mail-ej1-x635.google.com with SMTP id h24so10592474ejy.2;
 Thu, 03 Jun 2021 11:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KIjnUup0fgTpkPJTNgSG1C2yDBMs88vtIhRdFjYP7Bo=;
 b=t/J6HJpZcpZ7zxkShGZfzuNfkH/skQFwTTRebMnkBIsJi02H9YZnYNhhHJUWt3Y8T8
 WtF+YORYUKVYVvZ9MGoBmOSohE975AEQwytonsdBZUwVk7rBsQ9g7et1XDPqWE5VhPW7
 AlOTGXVlLdmr5PKfV2yao1+Oxrw4F7v2s3sLdND6Mq0mQQw/Xf0QBrLa8Gii91huOocM
 6rVSQJt2z6ww9mF3J1lxHt4hzgUmiqgZnlMmrlgj9WZfRwePfF/ZrSVvZ2LdKlqFG1er
 23gcUWqOtYsWClf0mRH4qySYC7KIsHIyGCb6JctmdeF4Hic1eOEi7kr2iTJ9AlH4daqR
 3XEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KIjnUup0fgTpkPJTNgSG1C2yDBMs88vtIhRdFjYP7Bo=;
 b=KfXOVmsg6SIxj7csTP8LKrRSS8h2VFs4sGzsCLBWBgvkAG6io0bDa/o19AqRlIIvSb
 ny54KAZnGsO/ZxjhriItrNUlPFXQplY8/QmEsiUGhyAvnF1600vEI9qsp21kXLBIxkoK
 23Xw/CN5JX8Mob+8OvOpuooAYSciMOprGGRuTVVLB9iBqQ6wb4n11F/SIgwNH+st3TC0
 FwXM0ViIdigY+Csm7ajN1G3JA3ffBNaBmT0sZj76MZSg08p68ULLIZE8HWept+rRLWoQ
 v77zv8FTnwg012gE3nAYFtrWirJ1s00L8sngv8jMtvfB24DlJ9cJGVGdMOn+2kzitrsn
 x4nQ==
X-Gm-Message-State: AOAM530LiniRdnEw41TmX7TbzkwONN5OsRLMtaHWdxPsS99sXXQSm4N2
 87yE5qXypZ3Rk+lYHbKqS2aWAMa6F5HlsX1DjbE=
X-Google-Smtp-Source: ABdhPJxPV8nOuGlZXmpjesweUFqflrhPmA0OpgH6//7OIzGs+Zak25/4RAljycFyu4M3WFajeRaIJQWV8ZtG6Ku6y8o=
X-Received: by 2002:a17:906:2481:: with SMTP id
 e1mr571618ejb.216.1622743395578; 
 Thu, 03 Jun 2021 11:03:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210601090140.261768-1-narmstrong@baylibre.com>
 <20210601090140.261768-2-narmstrong@baylibre.com>
In-Reply-To: <20210601090140.261768-2-narmstrong@baylibre.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 3 Jun 2021 20:03:04 +0200
Message-ID: <CAFBinCDR+6p4kTysimUVHg+VsvLnESotkmi1EV3g2kMWBUPAKQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] arm64: dts: meson-sm1-odroid: add missing enable gpio
 and supply for tf_io regulator
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: khilman@baylibre.com, jbrunet@baylibre.com, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, tobetter@gmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210603_110319_000081_C6ADCE40 
X-CRM114-Status: UNSURE (   8.45  )
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

On Tue, Jun 1, 2021 at 11:01 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> As described in the schematics of Odroid-C4 and Odroid-HC4, the TF_IO regulator
> is enabled by the GPIOE_2 GPIO and gets it's supply from VCC_5V.
>
> Fixes: 88d537bc92ca ("arm64: dts: meson: convert meson-sm1-odroid-c4 to dtsi")
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
