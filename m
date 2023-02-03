Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B22EC636CC
	for <linux-amlogic@archiver.kernel.org>; Fri,  3 Feb 2023 10:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4aunLIEs0TFMO06e7yX91BzdcgLqY8KiOxPEZADiym4=; b=OhEFJX5ng3g6CD
	C9tglOPGcarqIEMFND43/3CHM3ySXexWFXI01ySTonZMK4wFfd+T+mVb/DjJtjMuO0hNSevpMBqaP
	nSz6G+ATtNC612a5Ia84g9ER36L0IUJ8BrdH+JhMJgMtfjHTF6i29lMXXWup4fdq9KqS4MniyOwPs
	sTyCqbjlsAFXCNV57nKFZbE/f7wcvMd4uTdP4wHi4Ern+JaTYefKhW6ZTkDvDBZYvP9EFmT6PWLzG
	a7Ip0HTbwtLcdPGWueHvQH7SbN2deQPHx5l/rRVKKd+hMTg/OJ+BL8hXhWI9bvqrx/mW3iLZgf+lY
	OSdb8oFeFpyCMDOYiXTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNt8I-001Lfq-Ex; Fri, 03 Feb 2023 10:17:26 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNt8E-001Lcx-10
	for linux-amlogic@lists.infradead.org; Fri, 03 Feb 2023 10:17:23 +0000
Received: by mail-wr1-x42b.google.com with SMTP id q5so4229024wrv.0
        for <linux-amlogic@lists.infradead.org>; Fri, 03 Feb 2023 02:17:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g/WNjPQ18JRVRhyOrTsC5R8S4qdzTnKfuVYcyxolytU=;
        b=Xq2KYOfaW9x9GMrGHICotdHA+FksZKs3pQpRnwtOakPyg+wS67mMubbfAy8SL8pY+w
         IH9i/xAxGjFcjfniH1CvgTQ16VlvoFH8blqO9maFhRFysHVs4f52Jfe3BjH/IengRzy9
         q6i5/YQVF0ySyqw1lpZMVRuFzkxoin/ie+JEd98QOt0pSzBYUxmVGqy7UpK0+7HebgXC
         bUvUwWK8Fjt1Yp79pcizNnj6rZdssJWSoAvwyJ8LPrnMLgfm4DFrc57nbLabE3ktLsRc
         XaqJSjRgiQLn79HXVmAYKB4MJtvf5V1Xd335w84krCvIdWNOlbD8DfHj/7CEyWdIqCEm
         4Tpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g/WNjPQ18JRVRhyOrTsC5R8S4qdzTnKfuVYcyxolytU=;
        b=QfSkwMtnl4v/v37NdoD0WQ6WewS4kXlcAdVEjJ0ZUQMHHDdsNsvp8mowtTKlaFupki
         ieVAnz4w0vBgKpzgpfwP30fem0NaicG0V/O0k64BQ4DUlZcHraFVxbD3XFWfE5Kxrah+
         Et+IA+ihq4GQO+w2UpHVHl5FSoureP1GSYF2eB8eTowR3HB+GtR4ycycnannFjGsW+sj
         duSPS6M3U5MGA8L+oBu3IIQyIu3ASIhcIwBXA7ZoUG37dqCjAtFw6PzdkY8tXt2hpp5W
         4bzYuGkzvynf+kVXmZHB0eiYMa3rNaLXHWdlncRFBKijz296l8wXMPkRCgG0rRXjzVnk
         sbsA==
X-Gm-Message-State: AO0yUKWjLDpAKmX8FkdC/A60yVfxntJI2lWV5y1Y31r5LXt9uTlrAwvu
	pIFwiNYU/UFg0XBQP4+S/NEDyQ==
X-Google-Smtp-Source: AK7set8mPBxEY7bgE4SAboc3eVYbmvKHZm+if6cSAOlPEVguCHGCvPSCuS/A/oPxmUwblCrlwppX7g==
X-Received: by 2002:a05:6000:16c4:b0:2bf:f024:de79 with SMTP id h4-20020a05600016c400b002bff024de79mr11676673wrf.37.1675419438905;
        Fri, 03 Feb 2023 02:17:18 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id d2-20020a056000186200b002bddd75a83fsm1773632wri.8.2023.02.03.02.17.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Feb 2023 02:17:18 -0800 (PST)
Message-ID: <2195773d-12b4-0b32-26b0-488d78844e5f@linaro.org>
Date: Fri, 3 Feb 2023 11:17:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 5/9] ASoC: dt-bindings: meson: convert axg pdm to schema
Content-Language: en-US
To: Jerome Brunet <jbrunet@baylibre.com>, Mark Brown <broonie@kernel.org>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org
Cc: linux-amlogic@lists.infradead.org, Kevin Hilman <khilman@baylibre.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, linux-kernel@vger.kernel.org
References: <20230202183653.486216-1-jbrunet@baylibre.com>
 <20230202183653.486216-6-jbrunet@baylibre.com>
 <512edf50-a74d-815d-1278-39fdeb1c2d35@linaro.org>
 <1jtu03m6ia.fsf@starbuckisacylon.baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1jtu03m6ia.fsf@starbuckisacylon.baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_021722_158759_C5A239CF 
X-CRM114-Status: GOOD (  12.42  )
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

On 03/02/2023 10:37, Jerome Brunet wrote:
> 
> On Fri 03 Feb 2023 at 09:01, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> 
>> On 02/02/2023 19:36, Jerome Brunet wrote:
> 
> [...]
> 
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +  - "#sound-dai-cells"
>>> +  - clocks
>>> +  - clock-names
>>> +
>>> +if:
>>
>> Keep in allOf here (need to move ref from top to here)
>>
> 
> I'm not sure I get it. As it is, it seems to have the effect I had in
> mind while trying with dt_bindings_check.
> 
> What does it do when putting the conditional under the AllOf section ?

It avoids any future re-indents if you need to add one more if clause.

Best regards,
Krzysztof


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
