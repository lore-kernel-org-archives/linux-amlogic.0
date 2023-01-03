Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10509C4708E
	for <linux-amlogic@archiver.kernel.org>; Tue,  3 Jan 2023 21:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2+R5lTnwKSYmcDUNNI2jArudos1f/CGsQYoWFUCsfBA=; b=dp2WT9ZfpYlT4d
	9mI+MpKEA6tgbb/a8bu/yXlz7eii22b4+oJy7iiBD/lg8y+6GA1BYskc884crkaKp1Lxk2hKRjVyV
	rR+HIQYhRcRX5nM8+UBVJGvC2O75d0w9mhp7uISpws7+GjwVKPRHao/L1KTuVBtWL373cAWKNPAaW
	u9q3ky+y3nL6fUCqc6YOfALbXTjptmecH/gGpzzPtyavToacVH5PPd68LvXdUO0IX+Pt4AMBHbK/k
	AB0HqUcDDcjTU3EIr/fWMR3ysLwFlWaAmmvPdAFlyJfuA+6b45vQeprmpa6J2roRAx/4pOA5bFP6g
	/TNUvrHJdCe11nwksekA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCorm-0058MS-6c; Tue, 03 Jan 2023 21:30:38 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCooR-0057IL-G1; Tue, 03 Jan 2023 21:27:13 +0000
Received: by mail-ed1-x533.google.com with SMTP id b88so38478687edf.6;
        Tue, 03 Jan 2023 13:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hI++6uIbF26Dv21ktmycrREOIYmnkQTNouNNFxSqlfs=;
        b=qPrSO1WIAMiJ5FKOT9prYmL7H+27c9enK7XuCZQ7HivgXev8EZXQz6Duw/9LGFXYDR
         cuc1iHeqJJl9FNULBQnqVye/l3ryzZDT+1OVA2zlT16WpaEPdp2OcSWPWPaRQyXEqY0a
         qglCzpQm745f+Wk+aMLxzBHA+ch1UfUc9aDv9EyCtbDtenZ826WGAbTnG+Bz+/rQI+Ao
         dS0bq03WlJmUsFIMqYb+p+8eMuD9604TcnsryhKKkly8y+luXWSMbaskrf2VzoeWFbNl
         AR95IXWLK0Z54rPTZNzU1NAReSRHQH5Ke5iOJzn0QlAPSxqVqgBIplarraBlZm/7M91u
         BmRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hI++6uIbF26Dv21ktmycrREOIYmnkQTNouNNFxSqlfs=;
        b=QjvqfpfBCBSkSwY9d6Si3zrkmXZpy2yKX778iKRSpNKY+B8WVbcb+T7mAOTMpEBvvx
         K7/UkCmAny28MEosOjztZztKWlQ1xllOEuahFMeZupp4uQcO7YaJ0atBOCGGpeB+cjgS
         gXkNnQkbebQ4T9BHhK75xciJOlmlAUfQShzo+h5tOTpbHuY49Wf8Tr1oFpuuWv3OGxV0
         3AzmPshjx/Kzh78LvUh7VAnjS4Joro8Ou2Obks0Yzd0+cBEFb1iS0L6/Mt8kVlPvn4Gp
         X2qqVEouCn2KHF7P9OMok3Gp3mp6Nu7oAa4pj8YOJ+TYZaxFGHq1BWGzQwqN4sy+ePLG
         /HZw==
X-Gm-Message-State: AFqh2kqJ4MVLVOC0ecL1zd7zVqxNRAcyAa0oR/htkZebFUn6Pmc/8rtw
	V99Gi+wibSzLEhtgkgocpBOhV/y1B7G8Mu3Q9QM=
X-Google-Smtp-Source: AMrXdXuJemt4sp88WTvGhdf+4KvtqJ5cbVdF/C+z4wNNbIlxAEEXB2Sy9U3/SYnwiNVv1ddufGwzbM4BmyLoDiCFIPg=
X-Received: by 2002:a05:6402:120a:b0:462:2e27:3bf2 with SMTP id
 c10-20020a056402120a00b004622e273bf2mr4566144edw.13.1672781228785; Tue, 03
 Jan 2023 13:27:08 -0800 (PST)
MIME-Version: 1.0
References: <6c5948373d309408095c1a098b7b4c491c5265f7.1672490071.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <6c5948373d309408095c1a098b7b4c491c5265f7.1672490071.git.christophe.jaillet@wanadoo.fr>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 3 Jan 2023 22:26:57 +0100
Message-ID: <CAFBinCAPY3s4w5MPvyP9Y8Ov_eKVWoMu8fJwvmbn6r_+Qg8iLQ@mail.gmail.com>
Subject: Re: [PATCH] watchdog: meson_gxbb: Use devm_clk_get_enabled() helper
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, linux-kernel@vger.kernel.org, 
	kernel-janitors@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_132711_651371_52616106 
X-CRM114-Status: UNSURE (   9.04  )
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

On Sat, Dec 31, 2022 at 1:34 PM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> The devm_clk_get_enabled() helper:
>    - calls devm_clk_get()
>    - calls clk_prepare_enable() and registers what is needed in order to
>      call clk_disable_unprepare() when needed, as a managed resource.
>
> This simplifies the code and avoids the need of a dedicated function used
> with devm_add_action_or_reset().
>
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Thank you for this patch! It's:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
