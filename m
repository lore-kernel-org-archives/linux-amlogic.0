Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE2DC4332F
	for <linux-amlogic@archiver.kernel.org>; Fri, 25 Nov 2022 22:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZMykYKhEUmpRW0Npz0BfvyYMAn1gAc8glzv5tZ6v7uw=; b=yGn/Mr6au4G23X
	Yr1FpU5KqAUAF20WFBIGOABRMYFQTWx6x/YtiYXthlSn+iVh13hGGCSOeS1/gBVDQjFfXtRHv6IxG
	8/92BAQcIu9+iYvwjI1ikPDMUU+iUE4L/ULHh9gqcVGlR+ZNnnOLyJ8eD6+SlpfQvGerVDJhzmskr
	tZl06TBtcVtfei5qFnJ3KkzdD3X/4McZGMTqYqqXtLlI+3qRdlINqoEBezmIStEbzGa5h1o0AS6Aq
	8z3oXcXgKnh2wGUqCbM3KP8CjSy0DJ1Ou550j5xjYbUXH+Msp4sGosV4Bnmqy78ChT1oLyLdS4M8U
	/z3AGNFo0jj7Uxy88c5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyhes-002d9q-1f; Fri, 25 Nov 2022 22:58:58 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyheo-002d8m-Qc; Fri, 25 Nov 2022 22:58:55 +0000
Received: by mail-ed1-x530.google.com with SMTP id z63so8122799ede.1;
        Fri, 25 Nov 2022 14:58:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zrh33fKX0AFIpQoDMHBkz3JckH2DUhXrvzHY5NCN5no=;
        b=mQdoKuKnzMEl3ts3gcoDtpsH6y8L7YdGJz9PaUC6jCAz9+M7NZkUnA6V6SqAhznP7Y
         tSFx861pQR1oB+THa/q9XGELxGpmBvcUQmUyvfoFAlMjWclqOJDRddY3FyBqzZQmhMpV
         9pefcrcTsPH40Gman4KI9NLTs6tpUVgF3+lfJMMavgurXtira3YpuBzgwsJINgNYY00x
         1WIvktfNncDKhZXOODC7yW2xvwJBbrpRLNYGcIi5mTstd789NPUD4Y9hgC90cjfFgssJ
         wUTe7DcnjEEwXUvKfzW3MBmGThfDDE04xy3diEaIcefXRqYa7/FREMt7YIEu4h9XvocU
         GEaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zrh33fKX0AFIpQoDMHBkz3JckH2DUhXrvzHY5NCN5no=;
        b=FBgtduDYhS3xvIP778WABClPXyCxZmdcmXODrwuHWJ8rdXm13v/yUJnQ7RqQuAl3IJ
         Axnxr4QWPpZbmfLc7hcj0Bp7GirIYvjUYAIlniMDjb6JDFUp1cPWf38Tsu5Ycb2Fy2BJ
         3JQK+td/6mr0omqWVxQpHnlaIS0klNLViU70QY8Ajcjl7S0nsONL7fQ81PryCQG39bI2
         kKVEc6kWwJExwUrWF/mPwojDgd1gKVKV9LmUdfeAEQpjrVrulxLw0DWjOt7ETMhS8Ieo
         LeyT5FHEiN+U4BDsRxsj4mpxkUoOBiOQJ9OZNQuzfFlhfp01QqG7lR9jzC7ifPF96fTQ
         mTEQ==
X-Gm-Message-State: ANoB5pkjnYSl/xotKv136r5Tw0xaPoSd5e+6q60rWg/Y1/IS9P9AVyL3
	ir3W4RA0Hya69bjkaM2553L7Bn2MMmM/gsT9RqY=
X-Google-Smtp-Source: AA0mqf4qEx0qk48E7n/igXoN/8ITAy2dKB3urhN+QYQA7vj8vY/aA7c4YoItihhZk+R2xjYeYeLMIUoiVHRlbku+l4c=
X-Received: by 2002:a05:6402:3893:b0:461:b033:90ac with SMTP id
 fd19-20020a056402389300b00461b03390acmr25787621edb.257.1669417132710; Fri, 25
 Nov 2022 14:58:52 -0800 (PST)
MIME-Version: 1.0
References: <cover.1668602942.git.mazziesaccount@gmail.com> <a2f0835e8d3b5f5768d887ce47a1575ae11b19f0.1668602942.git.mazziesaccount@gmail.com>
In-Reply-To: <a2f0835e8d3b5f5768d887ce47a1575ae11b19f0.1668602942.git.mazziesaccount@gmail.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Fri, 25 Nov 2022 23:58:41 +0100
Message-ID: <CAFBinCAxL1WapkjHo6B_FNj_r3Y0jZ6P7qmXPjWfGK-ivuT5+w@mail.gmail.com>
Subject: Re: [PATCH RESEND v4 2/2] gpu: drm: meson: Use devm_regulator_*get_enable*()
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_145854_882326_F57ECA1E 
X-CRM114-Status: UNSURE (   6.67  )
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

On Wed, Nov 16, 2022 at 2:03 PM Matti Vaittinen
<mazziesaccount@gmail.com> wrote:
>
> Simplify using the devm_regulator_get_enable_optional(). Also drop the
> seemingly unused struct member 'hdmi_supply'.
Personally I'd replace "seemingly" with "now" because hdmi_supply was
used before (although only in this one function, which makes it a bit
pointless).
This is minor enough. So with or without that change this gets my:
Acked-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
