Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A6A5C54F54
	for <linux-amlogic@archiver.kernel.org>; Fri, 31 Jul 2026 15:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UAAtBdf24VHKbDPaWSweAGb0wUpVThgvkBxQJYmb2E4=; b=OBjhtgINh+gdAr
	XKO2gwUizd4UNWIBviPkEQboYKqge71IbFG3yoJgDAarwB6H+05okLPf2dalAOFXo6ichsjI60v9l
	xOTQDf8AwqPd7Fk5niOrObqZvnPTLQuHtRNkyGvrFU/rCGicQpZkjdrdU10KBB2lDfLNUDf++9Xwe
	ww1+h8BoKU41Gn69opY+OlK3Jf6jI3hyRP2/rzOmggin+j/SKsHBuF1hRACghgbFrsVAt3F/jPqZl
	iBAj499edkLBnmMfcskPVp9Eh55A8K03com2rpPzxC5oAVmDo3LNAgaRPI6EhU47fal0muBTP9/nn
	Q9F+MFtLvMWoa65gIi1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wppeG-0000000CwSP-3RfO;
	Fri, 31 Jul 2026 15:59:48 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wppeE-0000000CwRX-0UUi
	for linux-amlogic@lists.infradead.org;
	Fri, 31 Jul 2026 15:59:48 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-4799b3f7c83so898389f8f.2
        for <linux-amlogic@lists.infradead.org>; Fri, 31 Jul 2026 08:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785513584; x=1786118384; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:organization:autocrypt
         :content-language:cc:to:reply-to:subject:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=a87j8swmEQc4k8uOXUNzJXiAtCjtnQaei+ph1mC40T8=;
        b=khI+JoGdW8EU7NSRuiY3x3W0cij6+XmVOY8YQzw+a8lL1xpI079ukiGwRKaOE5lfxG
         yMcP4/jsPlbVL+gjpf19cEFpM3cTTtz3ClbwVinrDUkFJzis5ut5qXjy+Q4kaejI/5bC
         Ka1rP0pNvRDZwEd2bq+r2UuOtrOGRiYCq145XxO9ee2ianWvU/TWAP9xy7gBKtGOZnY9
         lMNVXcTnYvKX6xpjlthOyxMP3scwU3LrhMkQQaEp3bbmoTj3Llm7WnyseRSUPBdWiru4
         wGxf3oK3szkG6HhiEOwd1R5prX0G47hRHs5eFxP3CD7kNpaHLxPuirrntbTHken6HhdP
         83wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785513584; x=1786118384;
        h=content-transfer-encoding:content-type:organization:autocrypt
         :content-language:cc:to:reply-to:subject:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=a87j8swmEQc4k8uOXUNzJXiAtCjtnQaei+ph1mC40T8=;
        b=dDOjLw7xJI4u4k/zGqJ0MiOTpV9JjJ7p2yEw8kKqSuyHbJ9IJAjBAsjAgQIb8Lv1TN
         DTlsM3rHqGeoADYVtSsV3yF3763edzS5PWD+nzVuOU1bnLmoUnKAXEyi6aeisIk834OG
         ftWYT3JJ2NY+NGmRWGnW+UhkEIK95YqlZ2LauyQN0M3OlDedyyO7UHehC/3+O5+yl6Qm
         J0x50maQHnblAAoJtkToaebvXsUh4abWep++k9mmRTdv963IrpQ1MD602UiTeDghrm9A
         i+5fUnu+XT/LcryHOuqFZqFqUFo7TOnKmDQdUZ/lWJ0UbTg+kHNSfu1tShKhk7L3Zy2Q
         pJ5Q==
X-Gm-Message-State: AOJu0YzI2Bx76F5ua5FnW0Fcu/98JPO50Z/vp8LZ6/FR+ey6N5tdPV3v
	dicTrpMAie7aBBTRcXzclebMabOOHq4w+iveOvS8Tuqece/kvm4Vl+Ys5vvv4BRrjso=
X-Gm-Gg: AR+sD12j++Dr0am1goR0j4ZVigZrOxsoimOI10MyJ3Lrzn3J6EKQdOCluAbQiOj1LMB
	+nQHDFCrPxF0A3XxBF1YYHl/tiPsefcezm+4FsdROeOnp8tqFcFdha3t5luaR+0UQjRip6AGtMv
	ci+ZMAA1eU4V97kmYYklnR0kQ3jOZT1eXNTHliovxK/kXmA3Y9STJvDzabR6yQ7xh8GQjBZ/1Wm
	iC4K0GBPMnPlUthuvDZLfOmUpOXbMKQQcKBlp+qrnltzioamPQoaVk0e64cL/HdP6QGA8GKNl2+
	9hioM+o5mAvGdw241kLF33TodDNt9KqKFNONmuVZHqsrU65As4bdCqK5KugnAvxHHrXci6Z1h6Z
	pW7xPUFAtn/H4iAnGVeuuvhlrooufu2mRzJ1NSjCYQoD69a2c79l1E1nhTLM0LSrzUfHjaKDkT0
	oOvREwB48B4uE5tXmKbaZ8A2jCwvuD44g5a5pPe/vSCBpNw+3tvX8TOZ+hmie4I4mB/nLt355Do
	XPeJeGbAtfCEB4gC7sKvK0Qp+JkMELpI7+X+ewoTA==
X-Received: by 2002:a05:6000:240a:b0:47f:8558:8ff4 with SMTP id ffacd0b85a97d-47fd72ffa87mr374052f8f.54.1785513584059;
        Fri, 31 Jul 2026 08:59:44 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:6c49:d2f1:f94:1fb2? ([2a01:e0a:106d:1080:6c49:d2f1:f94:1fb2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41e2cf1sm6118853f8f.10.2026.07.31.08.59.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 08:59:43 -0700 (PDT)
Message-ID: <7db3a138-facb-4132-aed8-8e8dcd3bdf60@linaro.org>
Date: Fri, 31 Jul 2026 17:59:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [GIT PULL] amlogic ARM64 DT updates for v7.3
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
X-CRM114-CacheID: sfid-20260731_085946_231590_C12F097A 
X-CRM114-Status: UNSURE (   8.74  )
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

Here's the Amlogic ARM64 DT changes for v7.3, contains some overall
indentation cleanups for the Amlogic DTS, some new features support
for Amlogic A7 & A1 (clk measure), A9 (pinctrl, gpio-irq) and some
fixups for AXG to only enable PCIe on the S400 board.

Thanks,
Neil

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

   Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git tags/amlogic-arm64-dt-for-v7.3

for you to fetch changes up to 7f1d0cc86cb70fa550163b6f70fd1d484c03218e:

   arm64: dts: amlogic: meson-axg-s400: enable mipi_pcie_analog_dphy for PCIe (2026-07-20 14:31:02 +0200)

----------------------------------------------------------------
Amlogic ARM64 DT for v7.3:
- Amlogic AXG fixups for PCIe and NAND
- Overall indentation and whitespace fixups
- Amlogic A9 Pinctrl & GPIO IRQ nodes
- Clock measure nodes for Amlogic T7 & A1

----------------------------------------------------------------
Jian Hu (2):
       arm64: dts: meson: a1: Add clk measure support
       arm64: dts: amlogic: t7: Add clk measure support

Jun Yan (4):
       arm64: dts: amlogic: meson-axg: Disable nfc node by default
       arm64: dts: amlogic: meson-axg: Add missing nand_rb0 pin to nand_all_pins
       arm64: dts: amlogic: meson-axg: Disable pcie_phy node by default
       arm64: dts: amlogic: meson-axg-s400: enable mipi_pcie_analog_dphy for PCIe

Krzysztof Kozlowski (1):
       arm64: dts: amlogic: Correct indentation and whitespace

Xianwei Zhao (1):
       arm64: dts: amlogic: add some device nodes for A9

  arch/arm64/boot/dts/amlogic/amlogic-a9.dtsi        | 140 +++++++++++++++++++++
  arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi        |   5 +
  arch/arm64/boot/dts/amlogic/meson-a1.dtsi          |   5 +
  arch/arm64/boot/dts/amlogic/meson-axg-s400.dts     |   8 ++
  arch/arm64/boot/dts/amlogic/meson-axg.dtsi         |   5 +-
  arch/arm64/boot/dts/amlogic/meson-g12b-a311d.dtsi  |  38 +++---
  .../boot/dts/amlogic/meson-gxl-s905d-sml5442tw.dts |   2 +-
  arch/arm64/boot/dts/amlogic/meson-gxl.dtsi         |   2 +-
  8 files changed, 183 insertions(+), 22 deletions(-)

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
