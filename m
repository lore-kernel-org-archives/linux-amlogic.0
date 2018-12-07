Return-Path: <SRS0=njkK=OQ=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9CC5C07E85
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Dec 2018 10:02:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C4DE20645
	for <linux-amlogic@archiver.kernel.org>; Fri,  7 Dec 2018 10:02:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bxefQG34";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="0qRREStv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C4DE20645
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:
	From:To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LUhA5AXoJl/VIEQ3QgyC4/c4gKqsROEXEyJZTG0qaAA=; b=bxefQG34HgMHDy
	D5XjAB6mBxcYoMd6/AyrqdUatnmjDwl48yAoLWGWRoZNnUa6uFzhWtGG1oGBVXTYMttFw3+morZ0V
	O9Uql1hZ6WtKMLT5JKoYFjiBYDxIcg0HpCYjvud7EFGktjb1NjgkVqrOx/iLfhix4wqKoKiH7RibV
	CJI+P2BSxzgp/jjFWJxRGEvwhgP4Azq4RouW4UDZcoFeGAct4ZG0bPcyz+RfCVKDdauVCOMHHlKR0
	7FJVr1/sgZvJdz6TFlXfMDNLIbf9J7mfqXgNkDv1McAaN2v200G1EsesgpNyvib2PhWsfF/76m4ts
	KTdPUbCHQLyh0E9B7wiw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gVCxh-0008B8-LE; Fri, 07 Dec 2018 10:02:21 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gVCxd-0008AU-TV
 for linux-amlogic@lists.infradead.org; Fri, 07 Dec 2018 10:02:19 +0000
Received: by mail-wm1-x333.google.com with SMTP id c126so3890224wmh.0
 for <linux-amlogic@lists.infradead.org>; Fri, 07 Dec 2018 02:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=to:cc:from:subject:openpgp:autocrypt:organization:message-id:date
 :user-agent:mime-version:content-language:content-transfer-encoding;
 bh=cqmB+bSbN5RfFYYIFR2MMfX3gdg735gf+IpS86GTLXY=;
 b=0qRREStvK/tecbG9Uvrnh96kqs6gR5PqYFBjGzZ2oMow0keFLIVij3btmlb2IambTV
 TtvzllEEXAH9dldWHX+kXKrUUgh4LMrW5rJJMvEgiqnR4CwfKVPZzZeWdJ4W67Z6pI3D
 WkpyAIdqnBDyPfNnsSEtzJYnuS2hrSglqOn28x2It63ek+hxwBmluc3fr2fBRGLHAgxl
 VpURCVaZ/8TxPg9MpjrK340+Fr18tQk+nt+Sgrl2dOgfo+q9ka20ZsfUnScpNp2J/Lzw
 uYN+07L2Xe5GpBCQOsJfahQJreEYX75qIqkdQ27XNXbDTQOm9rxQy3w6pjghgnZrAVf6
 963Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:from:subject:openpgp:autocrypt
 :organization:message-id:date:user-agent:mime-version
 :content-language:content-transfer-encoding;
 bh=cqmB+bSbN5RfFYYIFR2MMfX3gdg735gf+IpS86GTLXY=;
 b=YDMqShJiJvVfOMDRLfeA1BU1CUz40amvEXqYhAKif9QWBHg0HwuvVGnVPInEZ9ygpf
 Ig8RwBYRxXJBx9UGbM9MvelgVNYCWS3sQIcd4zrK+1bsXsW7zx/fGzdGZKrRxCFQPwfG
 HKycFCqv8Erbwj+wZtSK4WjI/Th9OVGTVpdSqBpFsypB2eCZ5RWtkqP1YBgmHPjuQSja
 AudNjOEiiLeCPCa2vnORLmbWBYoJM/pQ5W9fvGQDv0aXl3XmYR72oxIict2kkzXy1pJ/
 jTzC89H6XI/059tkkjQgdcuGw37GwCAtkVjSzVfJGWuhyQJVO2mJxcMdZ/gdziPPhwTP
 NsGQ==
X-Gm-Message-State: AA+aEWblBW2RBRHhnf/JWp9ii+j0jsaFydD61MSGJyvGOFd4dwnbLfqE
 Wh8OgZyXDroB5R9wQZVYMnZzzSQabO/w7g==
X-Google-Smtp-Source: AFSGD/XynsaTUBd450+skR9q8nuFIAShWT2+DxIL3QMQVp46gbJJcZGtDBYtGP6sL3mdReQdwAgMvQ==
X-Received: by 2002:a1c:1f11:: with SMTP id f17mr1579285wmf.56.1544176925646; 
 Fri, 07 Dec 2018 02:02:05 -0800 (PST)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr.
 [90.63.244.31])
 by smtp.gmail.com with ESMTPSA id c9sm6354885wmh.27.2018.12.07.02.02.04
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 07 Dec 2018 02:02:05 -0800 (PST)
To: trini@konsulko.com
From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PULL u-boot] Please pull u-boot-amlogic-20181207
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT7CwHsEEwEKACUC
 GyMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheABQJXDO2CAhkBAAoJEBaat7Gkz/iubGIH/iyk
 RqvgB62oKOFlgOTYCMkYpm2aAOZZLf6VKHKc7DoVwuUkjHfIRXdslbrxi4pk5VKU6ZP9AKsN
 NtMZntB8WrBTtkAZfZbTF7850uwd3eU5cN/7N1Q6g0JQihE7w4GlIkEpQ8vwSg5W7hkx3yQ6
 2YzrUZh/b7QThXbNZ7xOeSEms014QXazx8+txR7jrGF3dYxBsCkotO/8DNtZ1R+aUvRfpKg5
 ZgABTC0LmAQnuUUf2PHcKFAHZo5KrdO+tyfL+LgTUXIXkK+tenkLsAJ0cagz1EZ5gntuheLD
 YJuzS4zN+1Asmb9kVKxhjSQOcIh6g2tw7vaYJgL/OzJtZi6JlIXOwE0ETVkGzwEIALyKDN/O
 GURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYpQTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXM
 coJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hi
 SvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY4yG6xI99NIPEVE9lNBXBKIlewIyVlkOa
 YvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoMMtsyw18YoX9BqMFInxqYQQ3j/HpVgTSv
 mo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUXoUk33HEAEQEAAcLAXwQYAQIACQUCTVkG
 zwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfnM7IbRuiSZS1unlySUVYu3SD6YBYnNi3G
 5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa33eDIHu/zr1HMKErm+2SD6PO9umRef8V8
 2o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCSKmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+
 RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJ
 C3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTTQbM0WUIBIcGmq38+OgUsMYu4NzLu7uZF
 Acmp6h8g
Organization: Baylibre
Message-ID: <e0806f82-a792-a875-87d7-7c11255b869a@baylibre.com>
Date: Fri, 7 Dec 2018 11:02:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181207_020218_011042_C537DDD8 
X-CRM114-Status: GOOD (  10.73  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-amlogic.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-amlogic>, 
 <mailto:linux-amlogic-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-amlogic/>
List-Post: <mailto:linux-amlogic@lists.infradead.org>
List-Help: <mailto:linux-amlogic-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-amlogic>,
 <mailto:linux-amlogic-request@lists.infradead.org?subject=subscribe>
Cc: linux-amlogic@lists.infradead.org,
 U-Boot Mailing List <u-boot@lists.denx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi Tom,

Two simple fixes for the pinctrl driver.

Thanks,
Neil

The following changes since commit d452f27b3ea806fd99aee4b73a723318032c1d5c:

  Prepare v2019.01-rc1 (2018-12-03 23:50:13 -0500)

are available in the Git repository at:

  git://git.denx.de/u-boot-amlogic.git tags/u-boot-amlogic-20181207

for you to fetch changes up to 139ebe9eb9dac96ab72680e7e8ba77ef9b4cc88b:

  pinctrl: meson: axg: Fix GPIO pin offsets (2018-12-07 11:01:09 +0100)

----------------------------------------------------------------
Two fixes for the Amlogic Pinctrl driver :
- bad usage of clrsetbits_le32
- bad pin definition for AXG Family

----------------------------------------------------------------
Carlo Caione (2):
      pinctrl: meson: Fix GPIO direction registers access
      pinctrl: meson: axg: Fix GPIO pin offsets

 drivers/pinctrl/meson/pinctrl-meson-axg.c | 22 +++++++++++-----------
 drivers/pinctrl/meson/pinctrl-meson.c     |  4 ++--
 2 files changed, 13 insertions(+), 13 deletions(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
