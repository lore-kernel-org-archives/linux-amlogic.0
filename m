Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6D0AC43458
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Jul 2026 09:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-Id:Subject:
	References:In-Reply-To:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XGSNTTFKPLYDu0cADStSL/+6LuiwJ+/g6dYqNNrMBcQ=; b=qMySj8wleQ775j
	rQ6msXAp9XiHUYQNUTqELZn9VCxGMWP1EHrmZGbDUkzDoiHAZlMBc2JSiU9IzTIPw84cnYsFXO5Sp
	fknJYGjfiPympZgtprgPVSEAdZXiKUVdnsVPXEXgP/79A6KlpRLTc6xOVgWY2bYCG/159nBORL5PI
	Vg2AuXF0CJLXGE3PBGpizJF6ZEvDyfsANaSLldvpFD5QBLAtrhn/gfxDMc5cc3Ept4B0S8TNV1h6G
	O7ItLJIvqKPaiXdkIMsXR2g5WfII6rJsQca4rCi3EFMWj/GyW1pOu14DsuebSAyaEJJnMhYo+R5vz
	DhqYPNmDNitmcxSKb2Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfaYB-00000006W9g-2BXv;
	Fri, 03 Jul 2026 09:51:11 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfaY8-00000006W8h-1Sw5
	for linux-amlogic@lists.infradead.org;
	Fri, 03 Jul 2026 09:51:09 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-493b61b52b6so2272715e9.1
        for <linux-amlogic@lists.infradead.org>; Fri, 03 Jul 2026 02:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783072266; x=1783677066; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=np1GDiFHQ1CuNSD1vWdE5qciQiEtsdk58lh2fmJm4uQ=;
        b=BEDhUaoAXDj4c7pMZxMFqKq5yte8sEdnpxqlmxTtC0HLx9Ax86M9F/oqAJwau2R6J8
         GfUVlmednRJ9UGyZKEA3cL03MHwy86r47WlKnP8WqMbsh70/dF29vNlDBScKOVT/m0pz
         9Fm5mukNo7kcm6oSxBASJyRjyndm+xWg5HNk7fTcE5HjZ0nrOWL+fVOQ5MV/ESiWsroW
         SqZspYMyQK/t/rTETx6Q7drGue6vjfH19oWwz/VfHy2nnvbN3hi+9so+1CEuIqIfaVwD
         mylN2mSdKwOuNgafu11ijNmUqGHWHmg5rwXlHWCF65yroUt/wKX+ASbsCznn7AF+/6jR
         nevQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783072266; x=1783677066;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=np1GDiFHQ1CuNSD1vWdE5qciQiEtsdk58lh2fmJm4uQ=;
        b=T1XHowf9ZjXgrvtaCsPWtSse1ZItkr7SCFR3ctSRF9rHLljDIH+jcrBL6YFl+oa30m
         n0HykNXQPLxnwXgNwEIAaOOFrgt/l9VsyzqvOZ/jPYhCYxHQrQ8WzqMz6w2JRPD/E1I1
         NPogZ4kasVn9QZ+prEuO2H/yexIxsf78DBEsSy3He2CI7ucnT/XE2dQSfLDED8cmgEUj
         RwR0ttKIQDkgGEaFIr2P19/F864cCwuIeayUXZ8w/oLlDHyzTZLTEayc8hWxM3OXfltP
         LlHDOYN3t9JR7AYJVZ72OqZ5xuU+UmM7Aupi9fR7Fcgyf0YGEDLf8u7NB27AnfJp59Er
         kT3Q==
X-Forwarded-Encrypted: i=1; AFNElJ+v6Qd24nrJj5cFaWKygFAdkGpeAj5JaEUyvZpEwhrEA2FPs2IUj/Fb7Ba2ukNIup7yEKHux/JFItTYigpY@lists.infradead.org
X-Gm-Message-State: AOJu0YzykNp7Aezd6BQg/VfPulmgwiJJF/+3g3ZqnZlQ8HQ4vSuzWOyv
	SDpc+5skf52kwnha5C80AmD54ZaBYsFJX2MthRnRoWsyLfx3f3E8Fcbjp8MqMHtYB6s=
X-Gm-Gg: AfdE7cl4/PUr/c1IhCxMD+P/omLpEsvfopRdFmv/VUFGrcvQbPAp+ZGKUs1/AHJr64+
	dsqvcyrP3YYXdn57Zy8WKPU4DEFAPCFCnSu/Nh3/EZcKR+GdInQ4nPq++dyxthbDw4oLT9RBgvW
	+7FF+U9CN9k6w4wtoz4Qy0t/l/x1L2LU4kJiPdoqbOv1ZoNbLYSjVTD9zI46g4lafd6ppw39Xw9
	84eO5udqtFD8GjCyt7zVKUj76INakNDjx4N5e7/jbGpl4tnZjWn0TPlr8x9DtkJeeFxyqo/wz+C
	i4jjVkR3tQzMX0p8WeAkiQuWD0crOenqeGRkAc6Y2IGYMqNij0Sleqk0CdY4H1lw9pSmToZJzzL
	02+EppLs62X0BnfNp2WEKA0NZnYdY4snqT5mLNsbk1gzyjmaKHzDM1aO1uEKEWSuMEj3HJO9SEB
	fYj/BCtbvOTeNAaQPnx6GqXh1/dfeWTQs7Zg==
X-Received: by 2002:a05:600c:60a:b0:492:68bc:3237 with SMTP id 5b1f17b1804b1-493c3cf8cc5mr80908995e9.32.1783072265643;
        Fri, 03 Jul 2026 02:51:05 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493bfe616f5sm126116215e9.1.2026.07.03.02.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 02:51:05 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20260421-clkmsr_a1_t7-v3-0-efc00b0f9e6b@amlogic.com>
References: <20260421-clkmsr_a1_t7-v3-0-efc00b0f9e6b@amlogic.com>
Subject: Re: (subset) [PATCH v3 0/4] soc: amlogic: clk-measure: add A1 and
 T7 support
Message-Id: <178307226476.3253856.1594545228633804096.b4-ty@b4>
Date: Fri, 03 Jul 2026 11:51:04 +0200
MIME-Version: 1.0
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_025108_396102_620B6A1E 
X-CRM114-Status: UNSURE (   9.28  )
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

Hi,

On Tue, 21 Apr 2026 16:17:40 +0800, Jian Hu wrote:
> This series adds Amlogic clock measurement support for A1 and T7 SoCs,
> including binding updates, driver additions, and device tree enablement.

Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v7.3/arm64-dt)

[3/4] arm64: dts: meson: a1: Add clk measure support
      https://git.kernel.org/amlogic/c/dd3d4327240dbd5e4a256f7428f92f454e23edba
[4/4] arm64: dts: amlogic: t7: Add clk measure support
      https://git.kernel.org/amlogic/c/d0a92020bb87b45a235d9d1f9ce76494e9ed02ca

These changes has been applied on the intermediate git tree [1].

The v7.3/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
for inclusion in their intermediate git branches in order to be sent to Linus during
the next merge window, or sooner if it's a set of fixes.

In the cases of fixes, those will be merged in the current release candidate
kernel and as soon they appear on the Linux master branch they will be
backported to the previous Stable and Long-Stable kernels [2].

The intermediate git branches are merged daily in the linux-next tree [3],
people are encouraged testing these pre-release kernels and report issues on the
relevant mailing-lists.

If problems are discovered on those changes, please submit a signed-off-by revert
patch followed by a corrective changeset.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
[3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

-- 
Neil


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
