Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED7BC77B73
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Apr 2023 19:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RxJZn+aLF20oOUeiM7ughF/CqdJ1WqIdwy56yhb6z+4=; b=jmg6zFcic5V/Op
	SJGtdZro84nMo4EhPQXbwRtk+SrnlN5qSO0oiA/klya9qdOT+KpDf174pBZdJrL/OEPfTmAMvNLth
	LNHVJ841wbIS9iqhDBsDQnm8BNAyZYrm6mItd3WI/cB8coi40z786CNbJuEMh+RdhMPF7C/YkLsgZ
	rtdCeDgaQGrVCY5jiYfFUZsjX8uVY0PAMJEEnBFUUWnqHlPMxCMrSeiIxgyzzDVXmGeNNOmVJ4Afz
	p+U4uteA/1hjDR17bpVlxsr1byJESmFSVRhFIgkzp6vf+G7FSNrHgdFUVMH4pc+r7TFoGzzmuP9+w
	ts9UVvlhiM7WAQ7aKScw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppDwH-006IcF-0Z;
	Wed, 19 Apr 2023 19:58:01 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppDwD-006Iau-2q
	for linux-amlogic@lists.infradead.org;
	Wed, 19 Apr 2023 19:57:59 +0000
Received: by mail-ej1-x635.google.com with SMTP id xi5so1040511ejb.13
        for <linux-amlogic@lists.infradead.org>; Wed, 19 Apr 2023 12:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681934274; x=1684526274;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QStVBT8Fo+0q7XfSVeUTQvruEN5UNY1t/XQiKMnzwNs=;
        b=g+4OJ9XeTAYXp7Mo9G1xc+pajMUg2awcJuYLhTQC4EoG2GdK1cgz9uKlY/EMyFuvVd
         nqxzeIhS08Wba8luhyeEsWuhppD2bNoGHCkKo2n/Ib/TuTCaxFKWFnP0wSU29ikXhwgy
         xB5/2EYP8d600Q/Mzw3MYcdshjwZo843v5I8b2o1Vylb2Im/YfE1eDYD+Ig/HLLv4hMg
         nKAg/mYdzquRdmfEprv7NTnnsvfjaW2ZgUu9TGUL4Ge3viFhF8TxyRyoB88fnKbxdR5l
         YExH40C9ots6iQEO0rXhtc4GVGZppUophp6QdatRoRBSx6vIcm54tzxTr9xFAHeL9nFe
         qsFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681934274; x=1684526274;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QStVBT8Fo+0q7XfSVeUTQvruEN5UNY1t/XQiKMnzwNs=;
        b=OwTT8EvReMVzAT7hsLYSZ8h3c3LvkWuPXiN4jCfBDs6HHoP9t5BtgxbDCPJbeUwFVU
         x+0fiHZTIlmDX1F8+toKjQELOvWiB4aVpowedXcWEDWJxGbddNbLKCCMisWb+e/N59+W
         v4oL4VArSiaDbqjuZJVgpWKYRCmYRF2MU9hrraJJAPOGooF/oe9tvmf+6fkFZ2TVK7dR
         quSDVd66tWhpy798iCfaFkJqTHfnjHzC8ULEYkeCg+4/ur8bIUqzYkbOeyQP3VP9pkac
         sjK3bCD5h4Dlrsg6nAR8wuMQncBjpxQWO6xmXy+50XxJCgLxI6WPoUWWNlY6ENO8o9v5
         IGUA==
X-Gm-Message-State: AAQBX9fBPQXI7jHQoKUU5GyMAf+hCXsIat9Ql4QHtNJQNg9F0Zz1lstm
	M96OLTCeSMvcmuW/rXbiHS9VFkGYG8f1w00SDwxJ1A==
X-Google-Smtp-Source: AKy350bd9rGROaDLjeW164+cgbfte4quNOdy5zEwI6FGqz7iZxE4bjvP2EuL76GKHtsqtZeFNIDTnQ==
X-Received: by 2002:a17:906:2a45:b0:94f:1ac0:850b with SMTP id k5-20020a1709062a4500b0094f1ac0850bmr16253833eje.71.1681934274369;
        Wed, 19 Apr 2023 12:57:54 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:976c:1d6c:6ed0:8935? ([2a02:810d:15c0:828:976c:1d6c:6ed0:8935])
        by smtp.gmail.com with ESMTPSA id l26-20020a170906231a00b0094f23a3c81bsm6603043eja.23.2023.04.19.12.57.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Apr 2023 12:57:53 -0700 (PDT)
Message-ID: <0978f227-1a6c-60c2-a537-98b8f2914a3b@linaro.org>
Date: Wed, 19 Apr 2023 21:57:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: amlogic: add Xiaomi Mi box 3
 binding
Content-Language: en-US
To: Karl Chan <exkcmailist@inbox.lv>, linux-amlogic@lists.infradead.org
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Karl Chan <exxxxkc@getgoogleoff.me>
References: <20230418145515.19547-1-exkcmailist@inbox.lv>
 <20230418145515.19547-2-exkcmailist@inbox.lv>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230418145515.19547-2-exkcmailist@inbox.lv>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_125757_957719_57F9B8CA 
X-CRM114-Status: UNSURE (   7.21  )
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

On 18/04/2023 16:55, Karl Chan wrote:
> From: "Karl Chan"  <exkcmailist@inbox.lv>
> 
> Add the board binding for the Xiaomi Mi box 3 Android Set-Top Box device.
> 
> Signed-off-by: Karl Chan <exxxxkc@getgoogleoff.me>

Your SoB does not match From. You have been told last time to which you
did not respond, not fix it.

NAK.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
