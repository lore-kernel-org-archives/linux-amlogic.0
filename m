Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4427C54F54
	for <linux-amlogic@archiver.kernel.org>; Fri, 31 Jul 2026 16:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IP9JorVvA4bssaSPrgojbRkOJCCDjpXeyejcckz2qp8=; b=r3SREvgK+O+m21
	wT0JJK5SwPBu2cw/5toWz05ZAnZtDo/NNFGOcnLe05MN1g86H4FVW4P1jz2zaLVFwOIIvQHZU+hqP
	MMJVcFMzD1HqjCYvf45vwPFZKq8+4eLEI+tLXtLvEfKA0Sintyd3mv0gMxZ77XIgBIUVviqHQHIJb
	xNE9/zxyOmxn8iuWxVFnW4ZfE09N9XbtYlQzJyU1PrIH8tfNT+Ml6g/CgzuoS6W23C5Md+4Dx53qa
	IX1eQ/5ooyLW6Qv8QZmcMZr3xBLbRcuAXmfArt620a+zbbC02xNQ90PW+oX3z2jAtqXxroFcST21B
	ObL+47QVkVJARexGRdKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wppev-0000000CwYU-3rNH;
	Fri, 31 Jul 2026 16:00:29 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wppes-0000000CwXq-2yxm
	for linux-amlogic@lists.infradead.org;
	Fri, 31 Jul 2026 16:00:28 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-6984169c126so2123775a12.1
        for <linux-amlogic@lists.infradead.org>; Fri, 31 Jul 2026 09:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785513625; x=1786118425; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:organization:autocrypt
         :content-language:cc:to:reply-to:subject:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SLNSgMQhVqM3POys4Jpc5TRM2LSV5osJzadKzZ0lcT8=;
        b=eogdYpOqrIHPxmFNFs2MG49N/HodfMd7voZiCkUN4olfbE/cMtB8B5i3UzlYSWJtd3
         3sWOz5ABZEnr7WglXl9qq8raXDOVeZArJ5nerm1vzIFXKwr83R7UiG2lXIBb1VxqTopS
         aVM5n8IccVpYgNJNMtcESkXN7T0w2BY6lqYGI7y8V10hhtEf57bO3dSLp4qIr9MCSdqF
         +GBShumiNkn52pzSKZO6iB1YsQpLVqjU8Ouh1dAMalpA9JhKiDb4pstFihDOm7onaStk
         zpCZlYs4DKFjsVI8t2eoTeMS/HsMxh8BKyYCvqAjZjzwv65Va+BqaJMJTaE3NUqRaXWv
         +gNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785513625; x=1786118425;
        h=content-transfer-encoding:content-type:organization:autocrypt
         :content-language:cc:to:reply-to:subject:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SLNSgMQhVqM3POys4Jpc5TRM2LSV5osJzadKzZ0lcT8=;
        b=kk9gIUWyeL3vBp/2qmUbeylDWSAcj7U1qI50Bmysz7nl3Uedf3GUyLfXWkq1V7MMUE
         +lYSEDRkT4sDSFmF9prWu2+Pwqup9lgzIJw7q9IoyZ1s80K4mBliQTg9tyR6PPmm7+tZ
         ouU2HqToAr29pjxbhVEwFDr3KVcS/X8qyNurbnwAE3CuT9O9UnSNkavBysYVKwB1/wKt
         IxGMi0qccCib28/Db2VWvhmNnQbsFQTqmX4eOkNnFbAhThcf9k1g2zPePr9CneyVZ8iw
         R4Ym3fc36Ew9T/A9n3wFL5SJrxngsE2mCvPOFifLR+k8JSgy0Ed0Qu1fmkUGbGG8eJMD
         +RiA==
X-Gm-Message-State: AOJu0YzlogCT1aJvU54OtsU89C4a2fDinCmIjjBed0eyLWfAei0bi8+j
	xSWD6L8WA+5BAqlpNWAbom+T29aTHu9nhAMZX7dKQJZ2o2c1vDxdxUKVRAAqKHh1E2M=
X-Gm-Gg: AR+sD13RRLiEpvOWMZHK+hSXqh5r1y2g/ePMXoU4FZGj1QO7t7iP/5c3yW9EO4UfWoc
	ZnqQ4EBXHkevrhkCkkhUhiN1cgrKpXQSa5mLopKk4dCnSvsCLR2jgRFaDVENeu42pe4VWtwX/0f
	E0ueRwhjEGX+jHQ5GlzEHYfW29s0ZM3LBnSAwogINS+KzRb4JoSDCpjKRJ/IfpGg9a7wAW4aTbD
	ek5/q3i/kv26KXDN1H5YZJX68Gxfaz9JerTrfqbaujg39Rya7qXEkj2lAp/4bG+p+mzYSygq/yD
	PfNVQDxgAMwMhWP/spmEcQRqUcnFo0Tr/fzJhW1PHCp5QBnSyhQKwIZwADhieko2EiLS4DAJ6VL
	DYbG5aj/nys8Rfbj7Cfo9qGP4g3ES2Qsd2f11PX/06cAE7V1fmEbVntT6mlZnL0cl/+XO0KjauV
	rsoqX6c/kIXKTFDGZOALdAfBCNz22g8aX4kLfY6g9hh5/cCc/oCJZKkm5fvXx48zpWweuU4Bdib
	QJS8ljQ8TJKHDGFfkaoJYfCACcYjZNMbkJCN4kD6g==
X-Received: by 2002:a05:6402:5305:b0:698:52b4:c2c8 with SMTP id 4fb4d7f45d1cf-6a0a7d13b50mr95707a12.34.1785513624522;
        Fri, 31 Jul 2026 09:00:24 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:6c49:d2f1:f94:1fb2? ([2a01:e0a:106d:1080:6c49:d2f1:f94:1fb2])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a09c6615a1sm1894955a12.27.2026.07.31.09.00.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 09:00:24 -0700 (PDT)
Message-ID: <41698506-1585-4b8d-930e-91a79b58b833@linaro.org>
Date: Fri, 31 Jul 2026 18:00:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] Amlogic drivers updates for v7.3
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_090026_773706_4C9EE06D 
X-CRM114-Status: UNSURE (   5.85  )
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

Here's drivers updates for Amlogic SoCs for v7.3, mainly fixes and new
SoC support in the Clock Measure driver.

Thanks,
Neil

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-drivers-for-v7.3

for you to fetch changes up to 67481152be2ec5de3529664c82054b43d6d4b9f5:

   soc: amlogic: meson-clk-measure: remove debugfs tree (2026-07-03 11:52:17 +0200)

----------------------------------------------------------------
Amlogic drivers for v7.3:
- Clock measure debugfs fixup
- Clock measure support for Amlogic A1 & T7

----------------------------------------------------------------
Jian Hu (2):
       dt-bindings: soc: amlogic: clk-measure: Add A1 and T7 compatible
       soc: amlogic: clk-measure: Add A1 and T7 support

Pengpeng Hou (1):
       soc: amlogic: meson-clk-measure: remove debugfs tree

  .../soc/amlogic/amlogic,meson-gx-clk-measure.yaml  |   2 +
  drivers/soc/amlogic/meson-clk-measure.c            | 286 +++++++++++++++++++++
  2 files changed, 288 insertions(+)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
