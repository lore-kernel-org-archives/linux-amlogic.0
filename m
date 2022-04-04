Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7A2AC433F5
	for <linux-amlogic@archiver.kernel.org>; Mon,  4 Apr 2022 07:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SX5FVZ3OGxJxgWQSB/91eRtXuTFj9XDcGcE6jcJ1+GU=; b=N8qgNhBweeyNsPMzlGwDSixLvR
	U6zMfH2QHUgd6d3RmSEsuDDdXtZUDQ1QMyApi0TuDJT7AWqPyUUzvUURdOBhEpiybX9vR3AvXS62N
	fiAuri5YauTR/OCOEDQlno/2k36CGW4BN1faMJtsw2yKHFvEUZsnkNyq8lvFr+hGpMVKiaNdVJpnH
	RtPl7opz45wDAlfrqf2sng+vJz8EEvnSvnwaQTj56xpby/P0xTNN6Qf11XMvNti7Lb148kSIR5DEB
	DxQH7WShdJHuXwzTjkt2HxxmbXM9QDa3j4EAFUOUsxoTjMmu42ALLgRX+gghflYlRQGGLTYNgUyp+
	65Cj17rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbHZ1-00Di7V-OQ; Mon, 04 Apr 2022 07:55:51 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbHYy-00Di5L-Qj
 for linux-amlogic@lists.infradead.org; Mon, 04 Apr 2022 07:55:50 +0000
Received: by mail-wr1-x436.google.com with SMTP id m30so13159628wrb.1
 for <linux-amlogic@lists.infradead.org>; Mon, 04 Apr 2022 00:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=V1icDH0sG8OaWddIUXR6PcbcxrUYjjWFhQsbuUZTX+Y=;
 b=Tw3MAAUiANAe0uEFzb9++dTXFe+Do+SLBajZ6hO83yFusQhBI65DjNmkWxisuJVsq7
 BskJzvKZ6ilqg5Tx+ek6w+kGGyqgESx5t0vylEG4O26RLL+Sh4/hfoPfHMAN+84kEtAB
 xsRZ4gD92u+kqt0g+YqgoduJ2QK1Dwjs3o69vsHON3rG4VGlB1HiqckgEwY1EDy/0gAz
 HMj9gHaym1LVcuKaDQHAuajwh+aAu/mLPZFNm2bLGiL6TTmv0Sq/XLqYp9/IK1Nqg5U5
 sEaoLFHTYq8vaapdwyafR8d82vvfOg8b0XKOMDTT9L4Yy6Pgi/FwM7/kCUHkIXUi9WnR
 g3FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=V1icDH0sG8OaWddIUXR6PcbcxrUYjjWFhQsbuUZTX+Y=;
 b=vxIFkx0EgDeT1EkfRViB5DLdqWmFTSJf9maTkAylYP9+pglJhnmZje849CjuZACvHq
 +b404Jfx5W23zsU4nAs8yU1UR2Ziz4P3WM4xD/SDjVRRyYIrQdjiABId9Yl3ldv5QC2B
 9wH0vG05/11//8aGaep0zWhscXvvKZDrKzn0ZDgVNXKZSQ8SGHSg2uIPVt/NmvXi80nb
 biS+uz7oGPm+gEzURYqteYS4hVDxWDzWvBcWq86bRcbZJgIIvpMHUdTu/jSuFV2LKeEN
 +hKAlWISAcNI2IDpMMueIaTj71cxN4nMQwku889xt/D5Cr995uH7H5q2grbVg1PZbI5i
 c1EA==
X-Gm-Message-State: AOAM531MfNwfV73Rkvu5lr4ABDOv/G2/mElXeH1cOqa9i9GED9um+E9I
 5xSZH8TZzfWK4rxi5zTkY7vI8Q==
X-Google-Smtp-Source: ABdhPJzE06u080NnA8O5JfsK+lkEqlZu8kMMgM12b40vEOScHUzhelvnKIPUV/Rqm0YUmqJQpWpySg==
X-Received: by 2002:a05:6000:10d1:b0:206:f55:8433 with SMTP id
 b17-20020a05600010d100b002060f558433mr3650798wrx.486.1649058943917; 
 Mon, 04 Apr 2022 00:55:43 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:1add:1b28:2457:eb46?
 ([2001:861:44c0:66c0:1add:1b28:2457:eb46])
 by smtp.gmail.com with ESMTPSA id
 s17-20020adfdb11000000b001f02d5fea43sm8846643wri.98.2022.04.04.00.55.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Apr 2022 00:55:43 -0700 (PDT)
Message-ID: <e3089ece-6ff3-0f6b-71ee-8b59ffad6119@baylibre.com>
Date: Mon, 4 Apr 2022 09:55:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2 0/4] arm64: meson: update dts for JetHub devices
Content-Language: en-US
To: Vyacheslav Bocharov <adeep@lexina.in>, Kevin Hilman
 <khilman@baylibre.com>, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20220326075110.1462301-1-adeep@lexina.in>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220326075110.1462301-1-adeep@lexina.in>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_005548_891862_EC5CB12E 
X-CRM114-Status: UNSURE (   9.00  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On 26/03/2022 08:51, Vyacheslav Bocharov wrote:
> Update dts for JetHub H1:
> - add bluetooth node for RTL8822CS uart port
> 
> Update dts for JetHub D1:
> - add ZigBee serial alias (ttyAML2) for backward compatibility
> - update voltage regulators and SDIO config to match board's reference design
> - update max freq for WiFi SDIO
> 
> Vyacheslav Bocharov (4):
>    arm64: meson: add dts bluetooth node for JetHub H1
>    arm64: meson: dts: update serial alias in dts for JetHub D1
>    arm64: meson: update SDIO voltage in dts for JetHub D1
>    arm64: meson: update WiFi SDIO in dts for JetHub D1
> 
>   .../amlogic/meson-axg-jethome-jethub-j100.dts    | 16 ++++++++++++----
>   .../meson-gxl-s905w-jethome-jethub-j80.dts       |  6 ++++++
>   2 files changed, 18 insertions(+), 4 deletions(-)
> 

For whole set:
Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
