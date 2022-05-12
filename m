Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87EFFC433EF
	for <linux-amlogic@archiver.kernel.org>; Thu, 12 May 2022 15:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wiuhymet/DBoDhxwbVCkIsGMW54EpsTp1s1Gkj6TW4g=; b=CN/GuTZP4jmfXY
	R69q+9Fc7nfLYoDUuVEM24nWcFlcqMbNozOeQMLCxzsdKye0vGlPU+OLKv9mde9luy5jT2S6dakqB
	lvlcQnLiLDFUYSeguWgKp0XYKBjxow97wuWgwoghJhpYsaqKU5cnDe8CSXtA4/+Gz1da1t3RYnx/R
	ZW9Vecj+cPhrxwNOKaHo7n+cbmqFdYwjzoFnUEKcJl/VeorXRia+ZBhq3BQoGzUatfWDOt+0Gv3qk
	OWQMictxZg2gWi1Tc0Zb+eTzaEXq1AvDTUzwA3sRdrFe8bnN3mFRrtmD1gIpsyJ6i7XHCjRjyVob/
	zJ2PeXEKcoMajwtga5jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npAoe-00CebZ-Oc; Thu, 12 May 2022 15:33:24 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npAoS-00CeTh-Ut
 for linux-amlogic@lists.infradead.org; Thu, 12 May 2022 15:33:14 +0000
Received: by mail-wr1-x431.google.com with SMTP id q23so7794944wra.1
 for <linux-amlogic@lists.infradead.org>; Thu, 12 May 2022 08:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=lJYjLsOwmK98ck5i9BA7AMHyM0+m23dl9hRD8ezZWsg=;
 b=7175BeiZTNnqicYIMG/cOrNiBlDvLKZRf1+0zm252nF0IbNg5cux+zMTmEhDwfdwjj
 D8y7WGXTRdBo9lGN10jQCjFjp7pJWpudmv1c6xod6aiIDaee9K72/VExLTRrN7jWxdE5
 C10ZP+ZKBU60oLVrauNVP14wSVba01uWfQREMogbhDXsfJgOF7ZGdkzwkvSqLXtdUmuo
 fYp/kJSJKcY/bwejIU9LcYeE6Y2TXIJsv7d27xixdHP9ZnErc6a77xHNuvfztBdeJiuu
 hyzdVNNhqH3JgJXfH3iFTFvJSFe00qzD8P13AW/XCioV+1dPbiyQcRb6AxQBqLRVMuZo
 Cjng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=lJYjLsOwmK98ck5i9BA7AMHyM0+m23dl9hRD8ezZWsg=;
 b=Gq1wrQricA3uAaIQ1PN6qRNZ0o0M4O1Yg5ao0Q0ep6GvCdLe2qL0h5+Z48EyVie6p0
 5V6RoI3QXSK5ctkTbIoZqXfK0rjdolpQmR5Wzq7FAOUifrof8+dlqDTS62ZNgr146Pr+
 oFMOwX6RCCHwPJVSlFQHepy3NGwSj+IPSikdW39M+FONn619m1G9JRUulIXacQrO/WF9
 n4zwfRNYdtYFidY+T495WNFYpO4cVPDpQqjTaHIpAa9pOrLGDW1TJgHi9cTA+ReCM6QQ
 1WBZrEYwE/fEM+EX/dUPnMrOzzp/5pidPQR0padmnlnQKgADYnczfaZoigiSKsNg6zqi
 sgZA==
X-Gm-Message-State: AOAM533GB2za2cz+VBoMRMn/p+Q/PovWPS1s5QInopd4/gp9cr6iVGBS
 Ol92N5iVISVralHVGioMj0edEg==
X-Google-Smtp-Source: ABdhPJwxvzdMxbrTjFcSe+SbbqUc4+HBjEVB6/fb0QRLLMg1yy6dIz3V8d6rId8zYFdHJl8rC71Tow==
X-Received: by 2002:adf:cf12:0:b0:20c:dc8b:ae99 with SMTP id
 o18-20020adfcf12000000b0020cdc8bae99mr211414wrj.550.1652369586258; 
 Thu, 12 May 2022 08:33:06 -0700 (PDT)
Received: from ?IPV6:2001:861:44c0:66c0:4b80:c5a9:17cd:ed1e?
 ([2001:861:44c0:66c0:4b80:c5a9:17cd:ed1e])
 by smtp.gmail.com with ESMTPSA id
 t16-20020a5d49d0000000b0020c5253d8edsm4505077wrs.57.2022.05.12.08.33.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 May 2022 08:33:05 -0700 (PDT)
Message-ID: <f3a08514-a92d-df2b-48f6-b29d0be42861@baylibre.com>
Date: Thu, 12 May 2022 17:33:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] drm/meson: Fix refcount leak in meson_encoder_hdmi_init
Content-Language: en-US
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Miaoqian Lin <linmq006@gmail.com>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220511054052.51981-1-linmq006@gmail.com>
 <CAFBinCAQaCNcYmF0kT6o7zOCHy3eV+vHOHC10XULYXvDO6_-6w@mail.gmail.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <CAFBinCAQaCNcYmF0kT6o7zOCHy3eV+vHOHC10XULYXvDO6_-6w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220512_083313_034103_62E1EF9C 
X-CRM114-Status: GOOD (  15.07  )
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

Hi,

On 12/05/2022 14:38, Martin Blumenstingl wrote:
> On Wed, May 11, 2022 at 7:41 AM Miaoqian Lin <linmq006@gmail.com> wrote:
>>
>> of_find_device_by_node() takes reference, we should use put_device()
>> to release it when not need anymore.
>> Add missing put_device() in error path to avoid refcount
>> leak.
>>
>> Fixes: 0af5e0b41110 ("drm/meson: encoder_hdmi: switch to bridge DRM_BRIDGE_ATTACH_NO_CONNECTOR")
>> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> 
> Thanks for sending this patch!
> 
> Neil, while reviewing this I noticed that on module unload we're also
> not calling put_device().
> This note doesn't affect this patch - but I am wondering if we need to
> put that put_device() during module unload on our TODO-list?
> 

Indeed, it should be fixed.

Neil


> 
> Best regards,
> Martin


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
