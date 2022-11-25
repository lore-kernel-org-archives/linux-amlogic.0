Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F6FAC4167B
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Nov 2022 22:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v9yFt089Fy9lSC8AIt2jGxkJ5hW0L4whMfgUeSpxBfk=; b=g821bDHA8q38oq
	Za+qYkwZyL0mXFfwtQ4kk3vHq7MMjsbf+jHSgfTPxxkvQ6/rrDvL0fwanRoeCEYsryKMkDOb2smjj
	4H8q6XLb0v0ASPKlsPLwRQ4l6YjZnHwwrmMvTZ4D7aQvH3u2rcyNeni62Zs3lE2WWCjYKX0yWOMKA
	F0f3HaycMNM9L4nIZLM5pCn26eNAr3yZuKMeuufnHHsBuVYiMI9vAkfiaXlYgjE5h2y/aEdht4Cye
	feOpeAYfHNAObjEEPpq2uuTRzmB0Oj8p6bZVe6oD+9Pw6osRyjlugwxCwIuq7h8s/l+cWVvtG2TO7
	2xBnwWg4dftWXGRBZzSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyhbV-002bjp-VC; Fri, 25 Nov 2022 22:55:29 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyhbL-002bfl-8l; Fri, 25 Nov 2022 22:55:20 +0000
Received: by mail-ej1-x62b.google.com with SMTP id n20so13245010ejh.0;
        Fri, 25 Nov 2022 14:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=r8n7cTPNZg+gBSjW3LwUxqp6QcotcNdrtpswWKit6NQ=;
        b=QsjwIiL2BKGfbrsY6iWFH3OeV9uUQl+VFQ1BL5HfO86NuuAIbUlAbesa/Pt2nw0oKR
         BqowAmt0Nlt0PxhYXl8aLfYr0M0V4owkPDTOQuZ2TVG89WfD9LFfEsAB/p2T9sAycinE
         FsSxJMo8v9MrTnkLZFMoLGEhNCMEXLnhASamLwb4F/tJkKvx0Kmj/8P3bKGjB7R7Ojgu
         NWt0QGr9f2lnvIBOx6T7qmwQEvKjlaiITm1Bnxkzq81YJXv00hpfbnEhyp5+/OFZCB65
         MlkO3VS/WOxz3rELIQksXxtJsTf4AI2qSrmXsey3LQPE19A7qp46SXs6JvTM0kDnrC0I
         XknQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r8n7cTPNZg+gBSjW3LwUxqp6QcotcNdrtpswWKit6NQ=;
        b=K8xiJ/Hz5Z1VEvdKU+B6/O8Ei39lydYVB3YU5q5b9A8Rq2S94ulUcGajeDfwBS/LRD
         2XsZxrSw6N1XvhByWnPS8b9Qb6HeThlpDNMKHpvnhSr3nCddwGoQX5RZlXNvpGv8cSn1
         KBwQw+wT3oKwqBWbw1d6JtvtCGCJ6Xo3eQbBlQ1sTFiO+a9l1mhxKYGNuu9AADqGxbIm
         BT5Bqp+8116cmTKkj510PHfLRsF5d3BX7FidBoqPd3X++uXJU3D7B/w0KI+BCS177lTz
         lRl15Pgp0p1IAm166GWRwaP+DR4NGBzyDYWaGA61Wq1Zjs4gbTLIwGqDZBgdvtng7pCm
         yuFA==
X-Gm-Message-State: ANoB5plz0iRTywXGvGXFerVelwqqebORDuQhcEWx4av+1J3Dg0RHds/N
	bFpZp25GNtxi4jTOxJsebHNiNZZnRENb2brh8hhVBhoLMfg=
X-Google-Smtp-Source: AA0mqf7rDupHIfq5Tr1gc/4+5fP9g3XcKelMvrs7nNr+BWKZQ9m5y1L0sEKlG1FfvRuY97ZSi1hyufQKetoBfSLHjQU=
X-Received: by 2002:a17:906:6bd8:b0:78b:a8d:e76a with SMTP id
 t24-20020a1709066bd800b0078b0a8de76amr35145152ejs.725.1669416915294; Fri, 25
 Nov 2022 14:55:15 -0800 (PST)
MIME-Version: 1.0
References: <20221125144120.476933-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221125144120.476933-1-krzysztof.kozlowski@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 25 Nov 2022 23:55:04 +0100
Message-ID: <CAFBinCCD5pTUre_QpMqW0KY8PLLhgBbaRkx9XSZq-8b5etpRHA@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: meson: align LED node names with dtschema
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_145519_339643_340C2289 
X-CRM114-Status: UNSURE (   8.26  )
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

On Fri, Nov 25, 2022 at 3:41 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> The node names should be generic and DT schema expects certain pattern:
>
>   meson8-minix-neo-x8.dtb: gpio-leds: 'blue' does not match any of the regexes: '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Thank you for this patch! It's:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
