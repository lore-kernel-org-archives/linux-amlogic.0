Return-Path: <SRS0=vaug=EL=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F85BC00A89
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Nov 2020 09:00:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61F072068D
	for <linux-amlogic@archiver.kernel.org>; Thu,  5 Nov 2020 09:00:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JX7UJowf";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="xuZR2yi7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61F072068D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b+shTQ5ZQyKRYmZeiBr4+96FNtDzHnLhBuBKnJw5YGk=; b=JX7UJowfQLU1cf2APwSSLN+g7E
	uvSJ9gnBqpyyL2A3HhA27bGa6tGdoYqx8qIem6UAFzK1VhkI+3DTh9C393DE/x3dtNIUqNmPjJ0lG
	l2EXXEZ7HBsACs8wfWSVcWuRsBYS95fgNUp/mjTl8JG88cLcd5S8LPMeBOXXrFrxavSlGlxNqeDr8
	FkWnFl5X5MbuE0Wi3iRftRW5VEZW70bP1kb3T/1uuVa1MRijK1eqD7TDtUVu9hPddztgKYORNJ/gs
	SUXPApCrRzCkHWgdRimS+SjhZTuu/2yA2eVHCWWrFbzC/VcE8LUKgVY8knCnsdjW5sEZ7LZEhKtIY
	VIvx4nsg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kab7Z-0006e7-Jf; Thu, 05 Nov 2020 08:59:53 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kab7W-0006dK-8U
 for linux-amlogic@lists.infradead.org; Thu, 05 Nov 2020 08:59:51 +0000
Received: by mail-wr1-x434.google.com with SMTP id y12so784201wrp.6
 for <linux-amlogic@lists.infradead.org>; Thu, 05 Nov 2020 00:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:autocrypt:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FYJaKSAoTqV97bqYgB1jVATXSlhdYo4wRjyClUx0BgQ=;
 b=xuZR2yi7BXaaTUEOo6oRAZgTRTejM2bBUqRr5XSpPXDQpOwGH1uwAGhcXh73rWI/In
 4EKjUSt/Jf6fcOGp7eq7VPeizGDMe9BSjXjSR6tS03br0LxprKEVfgic7AF8yBAFtWpt
 mIkFFdig5DvUYRSWdW211uYpzsNh3Y4cnzDogNpTeLRQsb618+bqpwfHnhiH5eujbc75
 aboeX2tMAgmU8lrJRDkPxdpW4Ox6c03PBgTY5ZiKCdbgY4dRO31pXiUTgEOmShrH90rH
 lb/B7HosgZcfRbVU72je4YmIImk/ro7GOTzo/S24oAKl25kVeMEptMwzlyQLj7RTWI5k
 Y9/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=FYJaKSAoTqV97bqYgB1jVATXSlhdYo4wRjyClUx0BgQ=;
 b=uHntclvwLsIA64kmA5xgjW5BN5YpBA2hgfdJjVFyJQ4n44fH+9+mkWAY9UQfK5EYc/
 Qe7aMDqv4Cwhhpiem4s20bFrgyb6+1rT1jl32tflBtz0FgtIaDNXTWovKxSmolvZh+qP
 E6mW8L24VdpCY6OkGHDoIXdrjf7bWBrUaNhtmpYJrf4cTrgwOVc8Y/jI4jNuSztZ+qJ+
 GiavejOrs/egvq2vMYSbNvgvjyVuTPcJ6qPK7TukIFO/QwLXJ1k1lYX6MmhdbVX5N2w7
 2/IQDkQ8ZqJxbmi/w0++WWuluQP7ewawF8mpwE8Rm1X9kKW/NtKLC3E4UrNEf3nd7YM3
 VAUg==
X-Gm-Message-State: AOAM532WFM/mcX6QCuNdR8PUw1Ndzzoq9sk9Yn1cq6f2ueM86Z20kEWa
 JeApUjhxaiS/1cRGVI4gACxB+L8WZ6haKgpZ
X-Google-Smtp-Source: ABdhPJyTHhgQN3gCHNxXHTyLtE3Xt6nnSq2+4gfF8zCFHTwfnurWkNRLHF9VUZ4QetBnqxJKM13ZAg==
X-Received: by 2002:adf:ab50:: with SMTP id r16mr1530148wrc.235.1604566788053; 
 Thu, 05 Nov 2020 00:59:48 -0800 (PST)
Received: from [192.168.1.9] (home.beaume.starnux.net. [82.236.8.43])
 by smtp.gmail.com with ESMTPSA id b63sm1780376wme.9.2020.11.05.00.59.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Nov 2020 00:59:47 -0800 (PST)
Subject: Re: Amlogic Text Offset regression
To: HK SH <shareahack@hotmail.com>,
 "linux-amlogic@lists.infradead.org" <linux-amlogic@lists.infradead.org>
References: <SG2PR03MB450210BE2ED8609110E2D085C2EE0@SG2PR03MB4502.apcprd03.prod.outlook.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 mQENBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAG0KE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT6JATsEEwEKACUC
 GyMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheABQJXDO2CAhkBAAoJEBaat7Gkz/iubGIH/iyk
 RqvgB62oKOFlgOTYCMkYpm2aAOZZLf6VKHKc7DoVwuUkjHfIRXdslbrxi4pk5VKU6ZP9AKsN
 NtMZntB8WrBTtkAZfZbTF7850uwd3eU5cN/7N1Q6g0JQihE7w4GlIkEpQ8vwSg5W7hkx3yQ6
 2YzrUZh/b7QThXbNZ7xOeSEms014QXazx8+txR7jrGF3dYxBsCkotO/8DNtZ1R+aUvRfpKg5
 ZgABTC0LmAQnuUUf2PHcKFAHZo5KrdO+tyfL+LgTUXIXkK+tenkLsAJ0cagz1EZ5gntuheLD
 YJuzS4zN+1Asmb9kVKxhjSQOcIh6g2tw7vaYJgL/OzJtZi6JlIW5AQ0ETVkGzwEIALyKDN/O
 GURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYpQTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXM
 coJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hi
 SvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY4yG6xI99NIPEVE9lNBXBKIlewIyVlkOa
 YvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoMMtsyw18YoX9BqMFInxqYQQ3j/HpVgTSv
 mo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUXoUk33HEAEQEAAYkBHwQYAQIACQUCTVkG
 zwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfnM7IbRuiSZS1unlySUVYu3SD6YBYnNi3G
 5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa33eDIHu/zr1HMKErm+2SD6PO9umRef8V8
 2o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCSKmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+
 RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJ
 C3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTTQbM0WUIBIcGmq38+OgUsMYu4NzLu7uZF
 Acmp6h8guQINBFYnf6QBEADQ+wBYa+X2n/xIQz/RUoGHf84Jm+yTqRT43t7sO48/cBW9vAn9
 GNwnJ3HRJWKATW0ZXrCr40ES/JqM1fUTfiFDB3VMdWpEfwOAT1zXS+0rX8yljgsWR1UvqyEP
 3xN0M/40Zk+rdmZKaZS8VQaXbveaiWMEmY7sBV3QvgOzB7UF2It1HwoCon5Y+PvyE3CguhBd
 9iq5iEampkMIkbA3FFCpQFI5Ai3BywkLzbA3ZtnMXR8Qt9gFZtyXvFQrB+/6hDzEPnBGZOOx
 zkd/iIX59SxBuS38LMlhPPycbFNmtauOC0DNpXCv9ACgC9tFw3exER/xQgSpDVc4vrL2Cacr
 wmQp1k9E0W+9pk/l8S1jcHx03hgCxPtQLOIyEu9iIJb27TjcXNjiInd7Uea195NldIrndD+x
 58/yU3X70qVY+eWbqzpdlwF1KRm6uV0ZOQhEhbi0FfKKgsYFgBIBchGqSOBsCbL35f9hK/JC
 6LnGDtSHeJs+jd9/qJj4WqF3x8i0sncQ/gszSajdhnWrxraG3b7/9ldMLpKo/OoihfLaCxtv
 xYmtw8TGhlMaiOxjDrohmY1z7f3rf6njskoIXUO0nabun1nPAiV1dpjleg60s3OmVQeEpr3a
 K7gR1ljkemJzM9NUoRROPaT7nMlNYQL+IwuthJd6XQqwzp1jRTGG26J97wARAQABiQM+BBgB
 AgAJBQJWJ3+kAhsCAikJEBaat7Gkz/iuwV0gBBkBAgAGBQJWJ3+kAAoJEHfc29rIyEnRk6MQ
 AJDo0nxsadLpYB26FALZsWlN74rnFXth5dQVQ7SkipmyFWZhFL8fQ9OiIoxWhM6rSg9+C1w+
 n45eByMg2b8H3mmQmyWztdI95OxSREKwbaXVapCcZnv52JRjlc3DoiiHqTZML5x1Z7lQ1T3F
 8o9sKrbFO1WQw1+Nc91+MU0MGN0jtfZ0Tvn/ouEZrSXCE4K3oDGtj3AdC764yZVq6CPigCgs
 6Ex80k6QlzCdVP3RKsnPO2xQXXPgyJPJlpD8bHHHW7OLfoR9DaBNympfcbQJeekQrTvyoASw
 EOTPKE6CVWrcQIztUp0WFTdRGgMK0cZB3Xfe6sOp24PQTHAKGtjTHNP/THomkH24Fum9K3iM
 /4Wh4V2eqGEgpdeSp5K+LdaNyNgaqzMOtt4HYk86LYLSHfFXywdlbGrY9+TqiJ+ZVW4trmui
 NIJCOku8SYansq34QzYM0x3UFRwff+45zNBEVzctSnremg1mVgrzOfXU8rt+4N1b2MxorPF8
 619aCwVP7U16qNSBaqiAJr4e5SNEnoAq18+1Gp8QsFG0ARY8xp+qaKBByWES7lRi3QbqAKZf
 yOHS6gmYo9gBmuAhc65/VtHMJtxwjpUeN4Bcs9HUpDMDVHdfeRa73wM+wY5potfQ5zkSp0Jp
 bxnv/cRBH6+c43stTffprd//4Hgz+nJcCgZKtCYIAPkUxABC85ID2CidzbraErVACmRoizhT
 KR2OiqSLW2x4xdmSiFNcIWkWJB6Qdri0Fzs2dHe8etD1HYaht1ZhZ810s7QOL7JwypO8dscN
 KTEkyoTGn6cWj0CX+PeP4xp8AR8ot4d0BhtUY34UPzjE1/xyrQFAdnLd0PP4wXxdIUuRs0+n
 WLY9Aou/vC1LAdlaGsoTVzJ2gX4fkKQIWhX0WVk41BSFeDKQ3RQ2pnuzwedLO94Bf6X0G48O
 VsbXrP9BZ6snXyHfebPnno/te5XRqZTL9aJOytB/1iUna+1MAwBxGFPvqeEUUyT+gx1l3Acl
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <1291bd44-84db-5cd3-cc7a-9ec82a96a21f@baylibre.com>
Date: Thu, 5 Nov 2020 09:57:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <SG2PR03MB450210BE2ED8609110E2D085C2EE0@SG2PR03MB4502.apcprd03.prod.outlook.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201105_035950_363493_FB8EB47F 
X-CRM114-Status: GOOD (  25.90  )
X-BeenThere: linux-amlogic@lists.infradead.org
X-Mailman-Version: 2.1.29
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

On 05/11/2020 09:51, HK SH wrote:
> Hello,
> 
> Since the text offset patch is removed from the kernel, no amlogic board is able to boot with 5.10-rc. While I can get it to boot only when I have mainline uboot and not all amlogic boards have mainline uboot support.
> I have tested Kernel 5.10-rc1 and 5.10.rc2 on Khadas VIm3 with mainline uboot and it works fine but when I try it on Odroid N2 or Odroid C4 then it gets stuck at starting kernel which seems that the kernel load address is not correct or something.

The only way to run Mainline Linux without the text offset patch/fix is to use the Legacy U-Boot image:
mkimage -A arm64 -O linux -T kernel -C none -a 0x1080000 -e 0x1080000 -n linux -d Image uImage

and use bootm

it's really a bug/regression in Amlogic's U-Boot fork, maybe HardKernel or Khadas could fix it.

Neil

> Odroid C4 Log below:
> SM1:BL:511f6b:81ca2f;FEAT:A0F83180:20282000;POC:F;RCY:0;EMMC:0;READ:0;0.0;CHK:0;                                                  
> bl2_stage_init 0x01                                                                                                                        
> bl2_stage_init 0x81                                                                                                                        
> hw id: 0x0000 - pwm id 0x01                                                                                                                
> bl2_stage_init 0xc1                                                                                                                        
> bl2_stage_init 0x02                        
>                                            
> L0:00000000                                
> L1:00000703                                
> L2:00008067                                
> L3:15000020                                
> S1:00000000
> B2:20282000
> B1:a0f83180
> 
> TE: 119887
> 
> BL2 Built : 20:29:41, Jun 18 2019. g12a ga659aac - luan.yuan@droid15-sz
> 
> Board ID = 1
> Set cpu clk to 24M
> Set clk81 to 24M
> Use GP1_pll as DSU clk.
> DSU clk: 1200 Mhz
> CPU clk: 1200 MHz
> Set clk81 to 166.6M
> eMMC boot @ 0
> sw8 s
> DDR driver_vesion: LPDDR4_PHY_V_0_1_15 build time: Jun 18 2019 20:29:37
> board id: 1
> Load FIP HDR from eMMC, src: 0x00010200, des: 0xfffd0000, size: 0x00004000, part: 0
> fw parse done
> Load ddrfw from eMMC, src: 0x00030200, des: 0xfffd0000, size: 0x0000c000, part: 0
> Load ddrfw from eMMC, src: 0x0002c200, des: 0xfffd0000, size: 0x00004000, part: 0
> PIEI prepare done
> fastboot data load
> 00000000
> emmc switch 1 ok
> 00000000
> emmc switch 2 ok
> fastboot data verify
> verify result: 255
> Cfg max: 2, cur: 1. Board id: 255. Force loop cfg
> DDR4 probe
> ddr clk to 1320MHz
> Load ddrfw from eMMC, src: 0x00014200, des: 0xfffd0000, size: 0x0000c000, part: 0
> 00000000
> emmc switch 0 ok
> 
> dmc_version 0001
> Check phy result
> INFO : End of initialization
> INFO : End of read enable training
> INFO : End of fine write leveling
> INFO : End of read dq deskew training
> INFO : End of MPR read delay center optimization
> INFO : End of Write leveling coarse delay
> INFO : End of write delay center optimization
> INFO : End of read delay center optimization
> INFO : End of max read latency training
> INFO : Training has run successfully!
> 1D training succeed
> Load ddrfw from eMMC, src: 0x00020200, des: 0xfffd0000, size: 0x0000c000, part: 0
> Check phy result
> INFO : End of initialization
> INFO : End of 2D read delay Voltage center optimization
> INFO : End of 2D write delay Voltage center optimization
> INFO : Training has run successfully!
> 
> R0_RxClkDly_Margin==106 ps 9
> R0_TxDqDly_Margi==118 ps 10
> 
> 
> R1_RxClkDly_Margin==0 ps 0
> R1_TxDqDly_Margi==0 ps 0
> 
>  dwc_ddrphy_apb_wr((0<<20)|(2<<16)|(0<<12)|(0xb0):0001 
> 
> soc_vref_reg_value 0x 0000004f 00000051 0000004f 0000004e 00000050 0000004e 0000004e 0000004d 0000004e 0000004f 0000004e 00000050 0000004f 0000004c 0000004e 0000004e 0000004e 0000004d 00000050 0000004f 0000004f 0000004d 0000004d 000001
> 2D training succeed
> aml_ddr_fw_vesion: LPDDR4_PHY_V_0_1_15 build time: Jun 18 2019 20:29:43
> auto size-- 65535DDR cs0 size: 2048MB
> DDR cs1 size: 2048MB
> DMC_DDR_CTRL: 00700024DDR size: 3928MB
> cs0 DataBus test pass
> cs1 DataBus test pass
> cs0 AddrBus test pass
> cs1 AddrBus test pass
> 
> non-sec scramble use zero key
> ddr scramble enabled
> 
> 100bdlr_step_size ps== 450
> result report
> boot times 0Enable ddr reg access
> 00000000
> emmc switch 3 ok
> Authentication key not yet programmed
> get rpmb counter error 0x00000007
> 00000000
> emmc switch 0 ok
> Load FIP HDR from eMMC, src: 0x00010200, des: 0x01700000, size: 0x00004000, part: 0
> Load BL3X from eMMC, src: 0x0003c200, des: 0x0172c000, size: 0x0009c000, part: 0
> bl2z: ptr: 05129330, size: 00001e40
> 0.0;M3 CHK:0;cm4_sp_mode 0
> MVN_1=0x00000000
> MVN_2=0x00000000
> [Image: g12a_v1.1.3386-3b31431 2019-05-21 10:41:54 luan.yuan@droid15-sz]
> OPS=0x10
> ring efuse init
> 2b 0c 10 00 01 31 15 00 00 09 36 30 43 57 50 50 
> [0.017354 Inits done]
> secure task start!
> high task start!
> low task start!
> run into bl31
> NOTICE:  BL31: v1.3(release):4fc40b1
> NOTICE:  BL31: Built : 15:57:33, May 22 2019
> NOTICE:  BL31: G12A normal boot!
> NOTICE:  BL31: BL33 decompress pass
> ERROR:   Error initializing runtime service opteed_fast
> 
> 
> U-Boot 2015.01 (Apr 14 2020 - 01:55:53)
> 
> DRAM:  3.5 GiB
> Relocation Offset is: d6eef000
> spi_post_bind(spifc): req_seq = 0
> register usb cfg[0][1] = 00000000d7f83b88
> MMC:   aml_priv->desc_buf = 0x00000000d3edf7c0
> aml_priv->desc_buf = 0x00000000d3ee1b00
> SDIO Port C: 0, SDIO Port B: 1
> co-phase 0x2, tx-dly 0, clock 400000
> co-phase 0x2, tx-dly 0, clock 400000
> co-phase 0x2, tx-dly 0, clock 400000
> emmc/sd response timeout, cmd8, status=0x1ff2800
> emmc/sd response timeout, cmd55, status=0x1ff2800
> co-phase 0x2, tx-dly 0, clock 400000
> co-phase 0x2, tx-dly 0, clock 40000000
> aml_sd_retry_refix[983]:delay = 0x0,gadjust =0x142000
> [mmc_startup] mmc refix success
> [mmc_init] mmc init success
> In:    serial
> Out:   serial
> Err:   serial
> vpu: error: vpu: check dts: FDT_ERR_BADMAGIC, load default parameters
> vpu: driver version: v20190313
> vpu: detect chip type: 12
> vpu: clk_level default: 7(666667000Hz), max: 7(666667000Hz)
> vpu: clk_level = 7
> vpu: vpu_power_on
> vpu: set_vpu_clk
> vpu: set clk: 666667000Hz, readback: 666666667Hz(0x100)
> vpu: set_vpu_clk finish
> vpu: vpu_module_init_config
> vpp: vpp_init
> vpp: g12a/b osd1 matrix rgb2yuv ..............
> vpp: g12a/b osd2 matrix rgb2yuv..............
> vpp: g12a/b osd3 matrix rgb2yuv..............
> cvbs: cpuid:0x2b
> cvbs_config_hdmipll_g12a
> cvbs_set_vid2_clk
> reading boot-logo.bmp.gz
> ** Unable to read file boot-logo.bmp.gz **
> reading boot-logo.bmp
> ** Unable to read file boot-logo.bmp **
> movi: not registered partition name, logo
> movi - Read/write command from/to SD/MMC for ODROID board
> 
> Usage:
> movi <read|write> <partition|sector> <offset> <address> [<length>]
>     - <read|write>  the command to access the storage
>     - <offset>  the offset from the start of given partiton in lba
>     - <address>  the memory address to load/store from/to the storage device
>     - [<length>]  the size of the block to read/write in bytes
>     - all parameters must be hexa-decimal only
> 
> [OSD]check dts: FDT_ERR_BADMAGIC, load default fb_addr parameters
> [OSD]set initrd_high: 0x3d800000
> [OSD]fb_addr for logo: 0x3d800000
> [OSD]check dts: FDT_ERR_BADMAGIC, load default fb_addr parameters
> [OSD]fb_addr for logo: 0x3d800000
> [OSD]VPP_OFIFO_SIZE:0xfff01fff
> [CANVAS]canvas init
> [CANVAS]addr=0x3d800000 width=5760, height=2160
> cvbs: outputmode[1080p60hz] is invalid
> vpp: vpp_matrix_update: 2
> set hdmitx VIC = 16
> config HPLL = 5940000 frac_rate = 1
> HPLL: 0x3b3a04f7
> HPLL: 0x1b3a04f7
> HPLLv1: 0xdb3a04f7
> config HPLL done
> j = 6  vid_clk_div = 1
> hdmitx phy setting done
> hdmitx: set enc for VIC: 16
> enc_vpu_bridge_reset[1319]
> rx version is 1.4 or below  div=10
> USB3.0 XHCI init start
> Net:   dwmac.ff3f0000
> Hit Enter or space or Ctrl+C key to stop autoboot -- :  0 
> ## Attempting fetch boot.ini in mmc:0...
> reading boot.ini
> 729 bytes read in 3 ms (237.3 KiB/s)
> ## Executing script at 04000000
> reading /Image
> 33964544 bytes read in 1112 ms (29.1 MiB/s)
> reading /dtbs/amlogic/meson-sm1-odroid-c4.dtb
> 71789 bytes read in 19 ms (3.6 MiB/s)
> reading /initramfs-linux.uimg
> 8448788 bytes read in 277 ms (29.1 MiB/s)
> [rsvmem] get fdtaddr NULL!
> rsvmem - reserve memory
> 
> Usage:
> rsvmem check                   - check reserved memory
> rsvmem dump                    - dump reserved memory
> 
> rsvmem check failed
> ## Loading init Ramdisk from Legacy Image at 03080000 ...
>    Image Name:   Ramdisk Image
>    Image Type:   AArch64 Linux RAMDisk Image (uncompressed)
>    Data Size:    8448724 Bytes = 8.1 MiB
>    Load Address: 00000000
>    Entry Point:  00000000
>    Verifying Checksum ... OK
> active_slot is <NULL>
> Unknown command 'store' - try 'help'
> No dtbo patitions found
> load dtb from 0x1000000 ......
> ## Flattened Device Tree blob at 20000000
>    Booting using the fdt blob at 0x20000000
> libfdt fdt_path_offset() returned FDT_ERR_NOTFOUND
> No valid dtbo image found
> libfdt fdt_path_offset() returned FDT_ERR_NOTFOUND
> [rsvmem] fdt get prop fail.
>    Loading Ramdisk to 3cff1000, end 3d7ffad4 ... OK
>    Loading Device Tree to 000000001ffeb000, end 000000001ffff86c ... OK
> 
> Starting kernel ...
> 
> uboot time: 5251814 us
> 
> 
> Kindly advice what is the plan forward in regards to run mainline kernel on amlogic boards which does not have mainline uboot 
> 
> Furkan Kardame,
> Manjaro ARM Team.
> 
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic
> 


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
