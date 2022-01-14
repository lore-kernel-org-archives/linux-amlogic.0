Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E62BC4332F
	for <linux-amlogic@archiver.kernel.org>; Fri, 14 Jan 2022 08:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=vEQX/yh/X/1ZUNmfJ+k3P15kf7ETUa0EDp5JSWyE6Bk=; b=qPGG7EtMW1Nz/2zN4wxXYaLc8+
	bplWucpTNhynGZ9v5FmgvMyvJ9Fycbx46xx4ei/MPTXSP4DiQyF4MuKod1GdugRExjPg0ZVno4LS3
	uRCrZ2fjaA37sZZXY1FGPnnv0H8xbiNswJUEwp9wmitJjXijZ9wS/5m+T0ubDb9kzoyXMA/aHWvGb
	BLuQlesRP0qrm5G10bprmaN5kl9R632U/WpQ1nxuOQZKhXVORT6CaKfHCKEPkqZd2KsywrYF/rZfg
	sf7EeAetG2AO+F6UYXywKPJhucCFbrnvwUYv1Jt5c2JYtYaEe6RB3sbSp4nUeoqFYaLCJZE+onP3r
	cU6WU95g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8HsZ-008EPR-A3; Fri, 14 Jan 2022 08:24:11 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8HsJ-008EJB-4C
 for linux-amlogic@lists.infradead.org; Fri, 14 Jan 2022 08:23:58 +0000
Received: by mail-wr1-x42f.google.com with SMTP id o3so14241198wrh.10
 for <linux-amlogic@lists.infradead.org>; Fri, 14 Jan 2022 00:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2SXNoXMdnGaSfy4KnO5GzxkSIdaPrK9msaNZUkt3T8Y=;
 b=TyRi88oeaki7bUJT9yoFyv6wUj9fpeayXEzTbacbcpowHz8FPfwCEa5pPeNp4hic2A
 1LUiMChZ/JgR4XfavZjb1aUuuO2byzLkGj1zOXheJtN63skSUHN8+KmF8d19GagVbsrr
 3fmQKuhufkBrR7HLsFJkJOrO+niqCVoiY6pXytGHfK3Z/P2h4xZlwMO0M6mfyCp643jF
 mVBK4R++pEHgYWm8fqj840V0Bd7FVUMAC9/gMdKD2vUoCfCbBcTjHl4ISxc5ELSpzHNM
 hEOssy1EdHg2qUjygRA/8pzlYYvPdaPBs1bBkE4hJnxLCH+S/QkVvPnwozU/+o0Z1GpP
 y65A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=2SXNoXMdnGaSfy4KnO5GzxkSIdaPrK9msaNZUkt3T8Y=;
 b=xvFdCJJ6V4AajkZeC9io8Y5FOHP9tQRXNtwhuTjDx/CSHE8L0SeD4x1ccvJeiGXDxt
 o/z6xYyB9IBd5o6DwZaLr6T4geXrbXG8dmHGC0eGEQWb2VKoBi2ojCf+zxAE673HOe8/
 VhdgWw83AGD2OKizS807PUoGj9FdLnve5rPBZYEwqpn65Q04bjBbpEulf9qoGUIHwHG7
 v3xwdiYKi5quCJZ6m8UL9KTriIBFgs4Ul83aR/dd7Yzrp9a6RL2mRnoNTU44YrX6NyQG
 K2gRCUAH01aYD2iMxSGAW9W9NB4Qk0O/L9MRyFdlHXiC2NCM7TUznk6OrEQg+i3GjoQO
 d9IA==
X-Gm-Message-State: AOAM5316nxguc1cVMXnC4X80pmyr4njiU49skieRTfV92EkvnVqWRXIR
 5SXCZp1udwLD6CD9Bu3U8ysoXA==
X-Google-Smtp-Source: ABdhPJwtTLFQyCczvzEvPARkSbWXpC8Q4vilLBDbd9n7KTtKKzr0kpI3M6BrzPhUDH5NWo5f3LRQ0Q==
X-Received: by 2002:a5d:6781:: with SMTP id v1mr2909142wru.714.1642148633286; 
 Fri, 14 Jan 2022 00:23:53 -0800 (PST)
Received: from ?IPv6:2001:861:44c0:66c0:a3fc:c40b:5afc:88ee?
 ([2001:861:44c0:66c0:a3fc:c40b:5afc:88ee])
 by smtp.gmail.com with ESMTPSA id i82sm5990464wma.23.2022.01.14.00.23.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 00:23:52 -0800 (PST)
Subject: Re: dw_hdmi is showing wrong colour after commit
 7cd70656d1285b79("drm/bridge: display-connector: implement bus fmts
 callbacks")
To: Fabio Estevam <festevam@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>
Cc: "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "Laurent.pinchart@ideasonboard.com" <Laurent.pinchart@ideasonboard.com>,
 "robert.foss@linaro.org" <robert.foss@linaro.org>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "martin.blumenstingl@googlemail.com" <martin.blumenstingl@googlemail.com>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <OS0PR01MB59221ED76B74231F5836D5FB86539@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CAOMZO5DJiCb5bJN5_nxnYa-FsK-u7QtFghWNzs_-udE42XPDeA@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <502f3ec4-fea4-8e14-c7a9-39418fc05d6d@baylibre.com>
Date: Fri, 14 Jan 2022 09:23:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAOMZO5DJiCb5bJN5_nxnYa-FsK-u7QtFghWNzs_-udE42XPDeA@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220114_002355_276330_ABD5D8C6 
X-CRM114-Status: GOOD (  16.44  )
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

On 13/01/2022 21:01, Fabio Estevam wrote:
> Hi Biju,
> 
> On Thu, Jan 13, 2022 at 2:45 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
>>
>> Hi All,
>>
>> RZ/G2{H, M, N} SoC has dw_hdmi IP and it was working ok(colour) till the commit
>> 7cd70656d1285b79("drm/bridge: display-connector: implement bus fmts callbacks").
>>
>> After this patch, the screen becomes greenish(may be it is setting it into YUV format??).
>>
>> By checking the code, previously it used to call get_input_fmt callback and set colour as RGB24.
>>
>> After this commit, it calls get_output_fmt_callbck and returns 3 outputformats(YUV16, YUV24 and RGB24)
>> And get_input_fmt callback, I see the outputformat as YUV16 instead of RGB24.
>>
>> Not sure, I am the only one seeing this issue with dw_HDMI driver.

This patch was introduced to maintain the bridge color format negotiation after using DRM_BRIDGE_ATTACH_NO_CONNECTOR,
but it seems it behaves incorrectly if the first bridge doesn't implement the negotiation callbacks.

Let me check the code to see how to fix that.

> 
> I have tested linux-next 20220112 on a imx6q-sabresd board, which shows:
> 
> dwhdmi-imx 120000.hdmi: Detected HDMI TX controller v1.30a with HDCP
> (DWC HDMI 3D TX PHY)
> 
> The colors are shown correctly here.
> 

The imx doesn't use DRM_BRIDGE_ATTACH_NO_CONNECTOR so the negotiation fails and use the RGB fallback input & output format.

Anyway thanks for testing

Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
