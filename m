Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A14AC77B73
	for <linux-amlogic@archiver.kernel.org>; Wed, 19 Apr 2023 19:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9xQ31VBNxJnoFnbHQdQEHINm1V1Tf/64guwtCWT0bbE=; b=HCoNiKl4HkQDBC
	G+u5u/jbrVhFIdG6I1ieOVy9C4lhYIfCn+2zCrvd58PiyxPVmL7r4Nd7nYUrvCP7U+IAulRg7Sujj
	l9iqM5YfAMhEizQA/xlcEcAI87olrtG8HMrQLXpJ4qpbg/3ppJ5t+vBKsunlk6yMOuxdvYMCgbtj3
	DC+Y2AhRWzMvBbrCChqznRLYteCbjQ4K3mBDaCerKy5IL8to5b2vPA/XwO07c15MHyKsLMSpSsaAa
	3MBwxU7rcxqYWD2UmlvIoJGnxkPknp5chzMeX8MRyZdX0I4WXP5z1/wsOTpLnCum1gdo2CiZf6K3X
	13lop5O+tYjwR+UZEywQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppDxK-006IoB-1X;
	Wed, 19 Apr 2023 19:59:06 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppDxF-006Ilr-3A
	for linux-amlogic@lists.infradead.org;
	Wed, 19 Apr 2023 19:59:03 +0000
Received: by mail-ej1-x62c.google.com with SMTP id kt6so1401299ejb.0
        for <linux-amlogic@lists.infradead.org>; Wed, 19 Apr 2023 12:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681934339; x=1684526339;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aVpt9sYJTPat9HTzksp4fUGvUNXr5TZYMpJLvWLAs48=;
        b=UCchYZWwyaAxmNQRMnL0/yxZ4z+iMuPi6CvIcH8er9PdAg/MY/Ta2EGvOtwShkRx0u
         ztigkRUqYt+pSm06PJzEss29M8wUYvermAmsruFrJR3QGp2rUxKC4iMwpk2BRKRSTzDo
         KgR2FXxx0uCJJbLH7jOtSfF/h9w6koKEP0m5Yvo34dHQhULhwcTech/NZ+vTt8TpfWV7
         DRoegta9ydAvXEMUGfwMARk2bzcrhYDY88NlQWxxk0Sl1S/lunNKjarvgWJNVz5IaQ3J
         AdfvwkqqMV0/fL0UMdfOKZXyHI3kyE/9krrzlUzuzJPKO2CPmQVvoX0zI0UywoT/JGlO
         Am0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681934339; x=1684526339;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aVpt9sYJTPat9HTzksp4fUGvUNXr5TZYMpJLvWLAs48=;
        b=QCCku6ygVtVgabxTbeYgXRLwps2+0DXIansWyBXWfhDrRQcdTgRz3KBTHivWLnCraU
         zsc6Yz3EF1UacPbi5c4OSwPD/Yod4/NiJ81G4YqOT48vZx2iPyx2f/jT4JyOsEN/Bm/k
         JX0ImfPgCCw/3fG6FpdFd+1qYv0JaPSTnxqU7WFShMQVRApfm6HPs8P4BU1Dpog2uzlB
         rT1hSet7QF7xY7ZE5mVM6ttZ/0sP/FFxa5JSE0JIMLU/CGgo+DqrPHhdbfsJ9LyEDCmL
         XqhIkO+4BT1XDNoNAJBrySI86ZhwQ25ed1Pjo6aKj7zs84zXN0THVr3VWFgSUc3UeMTe
         znOg==
X-Gm-Message-State: AAQBX9eVhzRkQ23LjBDo5M3GkDGVxRCPVOtOGBMeEzCQWwd6AM4yi1z0
	AqP9augNK6YZyCx9p66VmRY9tQ==
X-Google-Smtp-Source: AKy350YIYDJYSouUVSRt5Wq71UJfzT4ew+7n169i9LaxUWTLVoQm33LkHdjA2Il2yYY1OBlwS6F3NQ==
X-Received: by 2002:a17:907:8d13:b0:953:7d80:c40e with SMTP id tc19-20020a1709078d1300b009537d80c40emr600186ejc.0.1681934338819;
        Wed, 19 Apr 2023 12:58:58 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:976c:1d6c:6ed0:8935? ([2a02:810d:15c0:828:976c:1d6c:6ed0:8935])
        by smtp.gmail.com with ESMTPSA id rk1-20020a170907214100b0094f0a56e33esm7130721ejb.47.2023.04.19.12.58.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Apr 2023 12:58:58 -0700 (PDT)
Message-ID: <9d233482-b2e1-3fc6-0806-1d777779f104@linaro.org>
Date: Wed, 19 Apr 2023 21:58:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 2/2] arm64: dts: meson-gxl: add support for Xiaomi Mi
 box 3
Content-Language: en-US
To: Karl Chan <exkcmailist@inbox.lv>, linux-amlogic@lists.infradead.org
Cc: robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Karl Chan <exxxxkc@getgoogleoff.me>
References: <20230418145515.19547-1-exkcmailist@inbox.lv>
 <20230418145515.19547-3-exkcmailist@inbox.lv>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230418145515.19547-3-exkcmailist@inbox.lv>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_125902_063500_2F27A766 
X-CRM114-Status: UNSURE (   9.21  )
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
> The Xiaomi Mi box 3 is a TV box based on the Amlogic S905X chipset.
> There are two variants:
> - 2 GiB/8GIB
> - 1 GiB/4GIB
> 
> Both variants come with:
> - 802.11a/b/g/n/ac wifi (BCM4345)
> - HDMI , AV (CVBS) and S/PDIF optical output
> - 1x USB (utilizing both USB ports provided by the SoC)
> 
> Signed-off-by: Karl Chan <exxxxkc@getgoogleoff.me>

Still broken chain.

Also, drop stray blank lines from end of files.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
