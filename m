Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84C60C6FD19
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Mar 2023 08:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:Subject:From:
	MIME-Version:Date:Message-ID:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7zYfZdKszNlig/H/uQT+u9mUludTYFxHkMhO0bbwp8I=; b=Go9u4+ZlD7MEhBxSh4khP31Jzd
	TBd5kX0gPnR1bqfO4mBrc1IfmN5xwuEvZI8gIEF3HjDXo9kuWOxMRu3vR0ytjyoZWwvgy+2huO8U3
	M3sYfxG5zVDHg9g+UAOQ9QEtegXlRXxorG49oNT8JWAYQ5kTWt/Ii0Jb8Ob93IF/GcC95lPR9+gQg
	G7WFMN5jfuj4bbLv8HH7uq3rGPzfx1QZ8fkcTDheSXJ3dEGn8Ht5syDU6kOZgWjWgcJZ2yWdOSFke
	vMcNVkPGVTHTLzogrnujhJTE/OjutA8XqnBK6qLtnO0krUfuVpSPix9ZApmUryt3pqyYz9EVqLYz4
	3GzKZ7ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ6Oj-00BwFf-UK; Mon, 06 Mar 2023 08:40:46 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZ6OP-00Bw7D-63
	for linux-amlogic@lists.infradead.org; Mon, 06 Mar 2023 08:40:30 +0000
Received: by mail-wm1-x331.google.com with SMTP id o11-20020a05600c4fcb00b003eb33ea29a8so4681183wmq.1
        for <linux-amlogic@lists.infradead.org>; Mon, 06 Mar 2023 00:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678092022;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CI8nOCYcir+PVSzh9VSHPuyemxYicoPMWdGxXglPvJE=;
        b=fcqVpgvcb0JcmdIK+bIh331ssLKohV0jD6Zc63KVmewA51pi857VjnS+H8gKCW6Q0b
         m+ChcOgmK85mK4HwpOg7rnph2SwjcPjZgq9Paue6xGzR1aAf3zm3uMayYjmfZGL7c75D
         vBpfS5apHqfDddRQcBofvsL7K1CcISrAcsHKdGBxJQibrOYlsVc+KWF24aipy1eIfEC9
         UEaDd1f7ru1ZkHunggoN0Ar3VlXUXaqE5fn3zZiY+di9fymkJ0ubkW8K5ASNc0fhq6RI
         dewwExDuupL6aVwNXe7pRhdxYhn4N8FlMGozm+duNbaIkGTSpVgNEcVEjzPTdtPEB2a9
         xYOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678092022;
        h=content-transfer-encoding:in-reply-to:organization:references:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CI8nOCYcir+PVSzh9VSHPuyemxYicoPMWdGxXglPvJE=;
        b=u8gHiCnPcD+orBuA/zOsJjtBZSkAwV1m9wjLbJUMS7DpkmAlfJ9Y37D9npUYesrRMs
         48ko/XAvVcUp5lI16w143XhlKawM/YA5Su6bOA75Gs0Wt6qgQJ1zeMMrr/z6BftUeyWL
         uUS5LkbERmky1xDrlk+cxCeeEpRv3n7hu5Q8+DrTtMGg3n5zCz9ouDm1Br+ILdTXRgFO
         p61Ni4Y463fPCxAd/n7AC4xIBE419BCOiZT4FUkbB64gCzjUbUMapjMMcDc7oCGbbIJk
         OCtjaVbMu6pAiJ+3Vt0TECa+hY+HDvaI9i5dNGtSHRiRfSC3m1PBYPOMHVmOywioQICV
         lndQ==
X-Gm-Message-State: AO0yUKWreVSWnMHJi3blzHFpb1oZjgfOhDDjICOG9cnJlJZtHBuhL/YE
	swNDtf/7ccvlcpchXsRrnNJQ8w==
X-Google-Smtp-Source: AK7set+HiklQ5Pj3Ecu5ls0YxiVIUf5iWSejsV4jU3r9p/lAti/h36lJwAbNeyprI3tPfy7n/lOkag==
X-Received: by 2002:a05:600c:1914:b0:3db:3e8:feca with SMTP id j20-20020a05600c191400b003db03e8fecamr6270273wmq.15.1678092022624;
        Mon, 06 Mar 2023 00:40:22 -0800 (PST)
Received: from [192.168.7.111] (679773502.box.freepro.com. [212.114.21.58])
        by smtp.gmail.com with ESMTPSA id e41-20020a05600c4ba900b003e1f2e43a1csm9211195wmp.48.2023.03.06.00.40.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 00:40:22 -0800 (PST)
Message-ID: <3db5ae6c-a3f1-b64a-b605-4eac32fb4086@linaro.org>
Date: Mon, 6 Mar 2023 09:40:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 0/3] arm64: dts: meson: gxbb-kii-pro: device-tree
 updates
Content-Language: en-US
To: Christian Hewitt <christianshewitt@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230210170721.1285914-1-christianshewitt@gmail.com>
Organization: Linaro Developer Services
In-Reply-To: <20230210170721.1285914-1-christianshewitt@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_004025_277010_AA431249 
X-CRM114-Status: GOOD (  10.87  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi !

On 10/02/2023 18:07, Christian Hewitt wrote:
> First we sort nodes in the current dts and remove some blank lines. Then we
> add the remaining bits needed for Bluetooth to work. And finally we add the
> AIU audio card to have HDMI and S/PDIF audio output.
> 
> Changes since v1:
> 
> - Add reviews from Neil
> - Drop unneded 'okay' from audio patch
> 
> Christian Hewitt (3):
>    arm64: dts: meson: gxbb-kii-pro: sort and tidy the dts
>    arm64: dts: meson: gxbb-kii-pro: complete the bluetooth node
>    arm64: dts: meson: gxbb-kii-pro: add initial audio support
> 
>   .../boot/dts/amlogic/meson-gxbb-kii-pro.dts   | 83 ++++++++++++++++---
>   1 file changed, 72 insertions(+), 11 deletions(-)
> 

This doesn't apply anymore on v6.3-rc1, can you rebase ?
Thanks!

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
