Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE286CA5FFC
	for <linux-amlogic@archiver.kernel.org>; Tue,  6 Oct 2026 11:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KRWxqpZK9dLQ4x3LSfUNkaImtsc8vszn6INdjAvgDsA=; b=tnZArMGECfoA/T
	g77LfP1cXmstvqvevCXaPb8O0BcRSyPzF+r15LjF9K9ZydjvsO9XcK1t4K66VDnSWTYiByZNDu5l6
	gYhZQDoeDoeBcXGu95NoUmxZEzvc1RsVwNjM4c48tsq20WwTk9eSSWvIIMWgNKbz5e0s3BfhoCTI6
	w3B/uxDcQ/8rQp9i0212jOpCLkL1/M/xVM2SL1ExLzFzLnGdpi5E98HB5CnH+PLNqo5p7km4VRor4
	9pe1XvE3jCq0gW00inMkpBuK+5hQaVnOt5bAhgel2irOVC0zLwhMGgqIQ23V6s1on7Uf7DpSDn8Ak
	pxwqzgCJ/j3SIPsaSyBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE2vU-00000000aFZ-45Ja;
	Tue, 06 Oct 2026 11:01:41 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE2vR-00000000aEH-17t5
	for linux-amlogic@lists.infradead.org;
	Tue, 06 Oct 2026 11:01:39 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a16c1608faso7029635e9.0
        for <linux-amlogic@lists.infradead.org>; Tue, 06 Oct 2026 04:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791284495; x=1791889295; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:organization:autocrypt
         :content-language:cc:to:reply-to:subject:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dV0RSoFV6Y+3amLPhBXn9ZC7bZtBE6S7E5l+wTKLQOM=;
        b=SL7OEwNJ4xyjHTi+Djz30MeK1izz6cGfBMCKAxztII48UadsBdtGmHZJy1HODP2cE5
         G3MFRicJEnVrr7lATQKqRWhH4UL7cFZngArmj32sULEEnkCQcGnAeu7KPRdU/uHcIcJZ
         blzHCepyGXgcOXv+uei5stom1MizWqa2JTsJjFj9b2w67VARDKT596IewBYN+gHSV6WU
         AdwlcbswIj41nUO0xcXKu7MALQOveWOJPS3CfRa7eYzusQQVmNe8GY6mRBKeKBn5V5oP
         V09Oza85lnqjSTVwwRHuZ6YRbMjiyWgQWFMq0ddwsCrzrmpLq1OhD5tMluc2nFfgLeDK
         XjZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791284495; x=1791889295;
        h=content-transfer-encoding:content-type:organization:autocrypt
         :content-language:cc:to:reply-to:subject:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dV0RSoFV6Y+3amLPhBXn9ZC7bZtBE6S7E5l+wTKLQOM=;
        b=GGdAp6TfGfg3TbacDFULx4nK8VSPX60q9k51ZDQUJmQ+ixnMHngw7Xq6E7Kng8uQfc
         VvX/TCmPI5AuKDqljaTH9wbAjNUWAcC8Pt0jURfzvQYozIFruD+yxW4qvSCT7Wjcdtfh
         a0oihFLTuH3O0ZV4LuDZak8Mbe86RsauyurbjuvFKpnWFWFYioo/Gon+NgNKWTm8AyvE
         jkMHqtPzq2a3b46sUq2plct8hj71ZnbyNxLlQ3iuXGZL0DVM0EYXl7YY2o1mhGbDBRkR
         Xabq10WCed87GZjzdHocOIOA3KIUnt3qChXaBmg0T+7i0FG6h7EnZ3mzMFUNM2Z+IcVT
         R1Cw==
X-Gm-Message-State: AFuF++kIoGasP+I4UwEut5kZmIguzDP5xmkwti5OhBXG6co4OtFai+xI
	+eAeh8Tw6SxIM5IRSbT1FDCiRkuHBrk3oEfiIXuo4ga0wDqp+IdE3UiEMFeJrX99z9Q=
X-Gm-Gg: AYBFou3uzRbalOqhiYEZW3ghIp3K/ROcsXj46tf8uvdbdZRsdO4CGpjvUHa8arIh3a5
	7+3FOjWZXBSFvcLpeCQzMcyxe/slc+WshSBHfr6ucBfBqW/4hXqL/JNCTrOP+AxFds40i8JPgEn
	6rVYSp10KgCXosxfVcn2YrQXVL1z1yfBYpSA+HNjDn+WqFsxvkg4ue6SqcTbV+vDHI5LBMb6qgu
	6+h1Cc41spTtGaeF4ixX0rnN1net14gHnWQETQKANe9axvihQuOhmkrQD/6FFWOuFrT9blKdAuo
	gufS5OvpL0cBDcfYLdDhFNdA6gzAmg6GHs72sYvNpBvjD8Wb/ycU9yYJcrsFD4hIwWtZQyCi+6n
	n1tPUBfU0EkyQ6i/8+NaPh0ABnLLE5ZeirmryQpxDjOFSLc6kMF4KNTbCiaBGgBvrlot/Y6T8Id
	ZU+NAGJniWDBfMKsyjsVw+TLjqIT+WfoTj2EcHwQry7e4GIRywsew6vnKhMJ3ClYFybpQIbDZor
	q80fAFY/8jw2AzRroLgMWaRs6Dys8ua
X-Received: by 2002:a05:600c:6046:b0:4a0:321:6dad with SMTP id 5b1f17b1804b1-4a178a396c1mr32243445e9.16.1791284495071;
        Tue, 06 Oct 2026 04:01:35 -0700 (PDT)
Received: from [192.168.151.96] (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c6cd7c326sm2508351f8f.53.2026.10.06.04.01.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2026 04:01:33 -0700 (PDT)
Message-ID: <a1f0aa7d-be6b-4229-8345-66595a47be74@linaro.org>
Date: Tue, 6 Oct 2026 13:01:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] Amlogic drivers updates for v7.4
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
X-CRM114-CacheID: sfid-20261006_040137_338637_BCF1672A 
X-CRM114-Status: UNSURE (   6.27  )
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

Here's drivers updates for Amlogic SoCs for v7.4, mainly clock measure
support for Amlogic a4/a5/s7/s7d/s6/a9.

Thanks,
Neil

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

   Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-drivers-for-v7.4

for you to fetch changes up to a848d72aab71e19ea78180f2502ad7d12818723f:

   soc: amlogic: clk-measure: Optimize CLK_MSR_ID to reduce memory usage (2026-10-02 11:24:25 +0200)

----------------------------------------------------------------
Amlogic drivers for v7.4:
- Clock measure bindings reorg
- Clock measure support for Amlogic a4/a5/s7/s7d/s6/a9
- Clock mesure memory optimization

----------------------------------------------------------------
Chuan Liu (6):
       dt-bindings: soc: amlogic: Reordering compatible of clk-measure
       dt-bindings: soc: amlogic: Add clk-measure compatible to support more SoCs
       soc: amlogic: clk-measure: Support more measurement channels
       soc: amlogic: clk-measure: Align compatible entries with DT bindings
       soc: amlogic: clk-measure: Add support for more SoCs
       soc: amlogic: clk-measure: Optimize CLK_MSR_ID to reduce memory usage

  .../soc/amlogic/amlogic,meson-gx-clk-measure.yaml  |  16 +-
  drivers/soc/amlogic/meson-clk-measure.c            | 927 ++++++++++++++++++++-
  2 files changed, 923 insertions(+), 20 deletions(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
