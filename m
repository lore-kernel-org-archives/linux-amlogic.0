Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E63D3EE6F
	for <linux-amlogic@archiver.kernel.org>; Thu, 22 Jan 2026 14:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sEv/YTKGtZQ2uiUqcIKORdSHo5DlSz7gg8Lrx7m8Ry0=; b=KtO/jV934lBG35
	V5F45cyiu/AnSZjyDa5/2lPhuoH0t2u758bIQZz2+yHCVj8ev0U8J7GEhav8ppEASNWzk9xNiiVJ0
	DZk/T08F4gLiiZ66NXOY7xhBAANCb+nfPiRT5iyT95vSZzCKnIuyhLxS+kKYoOI9iM/IUWDb6xTWm
	l+Jj9Z9BK4AZiY3e5qXCdGiWMFDhUwrLvnfyuHWpHGyWoEZq6kARR4knewVULuGO6luWSPZpu4iVG
	YIrQAPSlcwkexEIBEnUWEHmKt+mTObghOn5fHPLhyHcZzbpRJUE+LMURFc5lOUaFpnelz/7w9rSV3
	ABxIWt5cKIE5qBQZSwaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viw32-00000007GYy-3XvQ;
	Thu, 22 Jan 2026 14:52:36 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viw2z-00000007GY0-0d5s
	for linux-amlogic@lists.infradead.org;
	Thu, 22 Jan 2026 14:52:35 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-4359019da8cso1000220f8f.1
        for <linux-amlogic@lists.infradead.org>; Thu, 22 Jan 2026 06:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769093550; x=1769698350; darn=lists.infradead.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rUR54Tyd17FTCOVGsEwV6x6lAtcghwoM6kBxhyVcCRI=;
        b=nTPejH+G8djzOIw9771egx5EgKaedulsPHSj5TkjgAFf05Rzuf0UHxhlPPXQZofQ4P
         aVBAcBw7lxusofAWqvZt+avERTkDnvD5cAKdfOGgX7q4W3IfWCbRiU86X59WjV0q5F3p
         RWOCy2UvGLTjKJqZ04HKGKR4hLUsqC0Ippw8xIWie2tZTILuLTAh7wXoCAqh6diSJRTZ
         mMfNY6mSUTIJlDAzFwkr5+JOqVQKYvmTGbO9lgo6wjw7zwF5HmAKwANffZO6WPbNsAnf
         +5lZwlR5M9WEKSH0WSUp5pKiyC552UvLt3MVJpAuUxObdehh2sAC+dsAlCeXrSAFV4Gi
         XrmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769093550; x=1769698350;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rUR54Tyd17FTCOVGsEwV6x6lAtcghwoM6kBxhyVcCRI=;
        b=B9OsERFeIMulBm++1Unu9fhV2MQG8SOKNExLyEoXsW4Vn47Ntaf7fZtkywnsOcSuMe
         Aj+W9ytVGyGUmVyWDbftwjfAhFnBh4HgU6vadFCj+Mgetc3+a/Vli+wCz3Nlkz82oCjm
         cZgu4qazWBWrIOwwSRZ6m+Otj2zjsuQAYTCCg6q6vnRzJ5zC1HLJuH9JpLiA7T6hxvq1
         5j3z0xVF1ex+USUj1YVHjlO59yc8GMmyUfOFiSffxkbrFhaIFigyXiMzkvM14O+fNgFG
         L3nLDW8ZCptrR8wK8B0l5KETJSyXPPKJ5OM+lxtOSAcT+Ztsb6TIzgw1rFrU5bLkhD1Y
         rJFA==
X-Gm-Message-State: AOJu0YxYHaKW80kezt1RaBOiHJyBB19GqMvm7w8ldwZwHwnQOxOIicij
	r8gtJ3V1nFCd4Sct4U4W7pIUcI1yNalkP375gj7nkiZnWNi8BFMGMC2F2G6uznkk59M=
X-Gm-Gg: AZuq6aL1Nizc+NvgyxFUasYLo3Z/Fs5WLtyhfLX+tK+00l0lCOooVbvPfo/b/HNoOYf
	UGqH/dpU7LSDQ0qAFE34TeurGW79MaHPWmshFGCNTcvCSHq/hyT+NIvsfcT0xTIRDVW2/soRVdF
	pqjHq43Bsu53LM4gpMKW7edQMKdRmq1PKj02bj48qX3AQEQoLXVaNz+gvUr4yDia7bve/w+4a2d
	+i/4y3MjFfHKpows51Ktvuj1Y8YZvx6iXnuAkair2HRcebETT5WxpdTzPjJJ+QECeQ3Cr0VPCvt
	1TFsUJyxml6GopRG+v4Oeu+zSJxtZUeLRrKAZoTOQscv4XsKvjPcDNuZDXwkWVATvs88Lrwm+ag
	e0kno6aESBwzI7CB/H+4KcCyfLZGZ02H/nS3Mp8rOd9ojyKdAsC7ZwaF9FY0xP1F2f/7cbx+r4P
	7M8s9V4Myf+jTdNMgpKZKY+ebcAhcQ2Qaq9FZafymODL6AHv8j+aZ4Hr8hEHNhQhg=
X-Received: by 2002:a05:6000:1acd:b0:431:656:c73a with SMTP id ffacd0b85a97d-4356a07745fmr33106298f8f.31.1769093550144;
        Thu, 22 Jan 2026 06:52:30 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:9dc7:6955:8850:f258? ([2a01:e0a:3d9:2080:9dc7:6955:8850:f258])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356997df75sm45715217f8f.29.2026.01.22.06.52.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 06:52:29 -0800 (PST)
Message-ID: <ffd5947f-788a-4fe9-9d64-6298840d0212@linaro.org>
Date: Thu, 22 Jan 2026 15:52:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] Amlogic drivers updates for v6.20
To: soc@kernel.org, arm@kernel.org
Cc: linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_065233_273068_F59C0090 
X-CRM114-Status: UNSURE (   4.42  )
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

Here's drivers updates for Amlogic SoCs, a single new SoC ID addition.

Thanks,
Neil

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-drivers-for-v6.20

for you to fetch changes up to 31fce0d2b13e6a4a12c9ba016e961418f8c82e34:

   soc: amlogic: meson-gx-socinfo: add new SoC id for S905Y4 (2026-01-13 08:58:58 +0100)

----------------------------------------------------------------
Amlogic Drivers for v6.20:
- add new SoC id for S905Y4

----------------------------------------------------------------
Nick Xie (1):
       soc: amlogic: meson-gx-socinfo: add new SoC id for S905Y4

  drivers/soc/amlogic/meson-gx-socinfo.c | 1 +
  1 file changed, 1 insertion(+)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
