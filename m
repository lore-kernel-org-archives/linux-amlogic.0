Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C7C3E77188
	for <linux-amlogic@archiver.kernel.org>; Mon,  6 Jan 2025 14:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gSrTTCMDV0mS2wV3Z84Q9l9RWaNMadOrGwtAqOqByzs=; b=R1W1BHW9JCJkQE
	50R/KJoBUwwSvkQO/2MQ1DkdIwI9Ezl/JUcdZwyrEC+aR0oph/FIvMzlzRuRwlFLeRJAUFHKiGbHW
	4d5jev2EfVexAqyxWj4xCzie0DyNYR6j21FzLP9vmyFduVUJCVFu40w5UgiIwe8e4ku46dhA2eGv2
	P6d1PBtrxsKdYf8iEiyd2+d5eVzkScMubAKl3V/jUyaIebYDKpz24y4U9GKGGUYrqFRaxrIogbN3u
	na5K64040AC/Dhf7kY+8G2aGELwVpY6LD7A++0GlelzujS3gu8/mUSFNNwC9F/pYvDNqabwn5PwvR
	9qsAu7FASm8jmlN6voKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUoDz-00000001bGC-1Xce;
	Mon, 06 Jan 2025 14:36:59 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUo2X-00000001Yxv-2Xsi
	for linux-amlogic@lists.infradead.org;
	Mon, 06 Jan 2025 14:25:10 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4361815b96cso95987605e9.1
        for <linux-amlogic@lists.infradead.org>; Mon, 06 Jan 2025 06:25:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736173508; x=1736778308; darn=lists.infradead.org;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7TIciRlELDCLEEoclqE+Kfoj3mhZ/N1C2qRWtIuv9OY=;
        b=OYN6LI3IKJEwfE90o+j/T2z7uY4Ochw4kUgru8EeILye/U+hsDZkDa9OlY1m3H3KeO
         wGmhvFhqnbedG8UxxRpHN1flC4WURpf15bLAcO/Wph26RWa6uPYFYRc0lu056mdYwk3K
         K8dMDImv6tJaWI7AhvLxvvgBGqwKN/ycy2Jm3VnI1VmCP/jAUwif2JYx9xUcmV+8+hLz
         Msol44QhiPowZCXmKQq2DIEKo2SgVfs0TXY2x2/ydgRw0N55gIKngKB6N3vZDmVrnUgj
         4bONqBOlBmWR0AfTzTm9Lo0fkMGNw4VXdu1dkkyCkTMVPMz8nNU+BnBqHoMhyNsGgRd3
         zJaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736173508; x=1736778308;
        h=content-transfer-encoding:organization:autocrypt:content-language
         :cc:to:reply-to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7TIciRlELDCLEEoclqE+Kfoj3mhZ/N1C2qRWtIuv9OY=;
        b=wQ950osX9b8jyfVBEg1vgoEP9/NWfPNiFSeFv1Eo5EFZScbVlOmamXZ7dVN6qBt7nk
         6S47e7rWr75rLCybA7iely+w1KIH2jrprMD9tCiam/T7U98sK7GF0BJzt/BvK1miRASt
         KQEDlMh+7noYsPEcjdGiQg7TEaUt2MdXxGVURYVkS3+aPQW7/hMvrqKhcZPPkBCZzzG8
         h9JwzDdo5FdzdFLGsE39XVyARpfn0o0Dr0pxls9tLnlGeZiGlIYyrNdvK+c4/sxe8clt
         cI9fAmzivje2SXVkUu9wZMYQDC4WyLHxRZ/IEQ01wTuFzXwjyvo8QYU+I/AeiG6h2b70
         zmsg==
X-Gm-Message-State: AOJu0YyR+M3QG+LQtR/AoffxKFrFDcdIbI7bHXibBn/zJhcMAbt3XRxU
	fSAnfUVikkeLQ4TBCRrfDY87WFV5bNhiZv9K/2nYz1xobOhOmJtmF5sz0DbSmaHaPUxWDdcu7Ty
	c
X-Gm-Gg: ASbGncs730qou+ixPBLizyxNxfw7MheiKkIinq+bVrpqbRr1HoCfdo/Ew/OfH+GJjTO
	bkREPrn73hZv9i1z0vDt6sARG53RX8jle94yA1q2I4ZrYbvGJfZra4BsB8eyvGdCGCViBhK2pBN
	Zw3nY3Msiv0mwKCkZOiU8mL8ysyzGSwgt0MiUdkaR9pzSsSYNRoZJGMYwFB13M2HX+rS1oBlkif
	60P9jUReAFH5O/ayY+k1KYPrFQqX7pXxxJVPeaG6tPY9xLoTF0oGL3FeL/wCC1N/1sz+n7hserk
	ipEoC7hAmowfUpn4bY1TdvJQbvir
X-Google-Smtp-Source: AGHT+IFDv6yPrrMdiLufyHJiRsCS+tNLTAQN7y7Zs6wjnXNJFvDTqtBqNWJ/t9oqV6eZf1xaBL1XqA==
X-Received: by 2002:a05:600c:1912:b0:434:a968:89a3 with SMTP id 5b1f17b1804b1-436686436f9mr515572745e9.9.1736173508239;
        Mon, 06 Jan 2025 06:25:08 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:95:e905:1421:811c? ([2a01:e0a:982:cbb0:95:e905:1421:811c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4366127c639sm564181945e9.31.2025.01.06.06.25.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 06:25:07 -0800 (PST)
Message-ID: <d22513cc-c326-443c-982b-78adf755d3dc@linaro.org>
Date: Mon, 6 Jan 2025 15:25:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] Amlogic drivers updates for v6.14
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
X-CRM114-CacheID: sfid-20250106_062509_648621_B15042E1 
X-CRM114-Status: UNSURE (   5.40  )
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
Reply-To: neil.armstrong@linaro.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

Hi,

Here's the final DT bindings change that will give 100% success in Amlogic
ARM64 & ARM64 DT Bindings checks, with the mmc-slot bindings change routed
via the MMC tree.

Thanks,
Neil

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

   Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-drivers-for-v6.14

for you to fetch changes up to 960a4140ade8f6ba44e78dc40b80bbf272027805:

   dt-bindings: soc: amlogic,meson-gx-hhi-sysctrl: Document the System Control registers found on early Meson SoC (2024-12-11 09:49:49 +0100)

----------------------------------------------------------------
Amlogic drivers changes for v6.14:
- Document the System Control registers found on early Meson SoC

----------------------------------------------------------------
Neil Armstrong (1):
       dt-bindings: soc: amlogic,meson-gx-hhi-sysctrl: Document the System Control registers found on early Meson SoC

  .../bindings/soc/amlogic/amlogic,meson-gx-hhi-sysctrl.yaml | 14 ++++++++++++++
  1 file changed, 14 insertions(+)


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
