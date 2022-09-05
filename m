Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B07E9ECAAD5
	for <linux-amlogic@archiver.kernel.org>; Mon,  5 Sep 2022 07:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s5mvMD0nnSd542uHGinBLGZtILRefuMoeOMOHoHuFD4=; b=s6I9O9u5mCgoNP
	rTJfjwT8N1C2Jk3paG/9oFOMlXa/WmCXfdNW3xMLhdwkICeG5V4T9CB5l7ZMZFpQIVXKDcI1vJ5Je
	jaXRERV3+S0/vQgX00JNuLqw8ZGqyeppJVZwnEPGXFwuY9hHzjH8Vrkls0tLKQF3tj8ES0t7paH/z
	u+O+RXs39Emciuq5r4A0wFkn4TGY1GrNBY8eTwClLIOSWI3TW40KbIhfeih/5G4i5P++QTzwtV/Gh
	Pgj8wxJYss9tOy/md5K79hrk9eB4Ia0rqU1zR8n2tM3zwZoUm6L2Vv4ruvOSYCUf0Imv/t63Ns0up
	LfS4521e9piR9RiHqvoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV6zd-00DqU4-NN; Mon, 05 Sep 2022 07:58:06 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oV6Kq-00D5p1-2J
	for linux-amlogic@lists.infradead.org; Mon, 05 Sep 2022 07:16:05 +0000
Received: by mail-wr1-x429.google.com with SMTP id b5so10053839wrr.5
        for <linux-amlogic@lists.infradead.org>; Mon, 05 Sep 2022 00:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date;
        bh=LvkdhQt9U7FwpSw5oGil04BEBWuHJyg4UYV++2Rwli0=;
        b=0rnrmyUF1wHBQmVpuhphEhKxh0LoUI2nl5vCDnWvCwY8z+jvSk6GjAGJlceNGVNf7j
         KESM/LTHGGBTsQagPG9L6DfD3UWDUqa8knHG8sMMc4aSmvxkdtBr5lMZLnUNQUzJSEcb
         Qpc4IAAjTfwqtPmXWNn4i5IfSpV7AkGFmozBFGomRblmY5BvQapUgiYzoel/+voB2XJD
         DPdiJoPi7xq+knz1B4t8SUL3ZmJTtD2TiBHBzL9Gb2MWSCy8CQb6tqRrQR9tTJXZ21vR
         COnCIEGaX1OY19a0oLDGCaZKgo5CrgWVrY0k+4HdWreRDozkTpzWgIcQPeYEtly0OVoe
         2b7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=LvkdhQt9U7FwpSw5oGil04BEBWuHJyg4UYV++2Rwli0=;
        b=ORHghpsRHNh8aMsAAgfFf9OhznKigaupfD6bc99N0Csna/K3bJhCwyHbf2V06D07vV
         +Jc9wrsNOx5cBQt5oaxz9aeJLJONVJbSlPcNw1CtaBv4ZA/XskJk1j+iql980xkMx/O5
         L4VhRSXWQ2ZwScZjkIZ+JsCsfiSDy5QgFPsBcMAZPX5+pbWDxsQ1m0s5Dcu8A7uGbt8k
         YK0vlbM0kgVp9426WWeGXvW3XTckto67octKekOu9IfCi+NBHwifkb1lXdCSnN0gi2wW
         1qJ6ieAaPX5jQE0fhR0upektcC8m7wlsKU+pkVAbBOgQl1rAKoUBy+ercuYOXsqpEr+X
         yD3w==
X-Gm-Message-State: ACgBeo0V+soAl8rNIw3VkxMN3amTJTdjoU1qqSDya9ncIYkVR4fF1o9F
	kvNj9md9Hv2OA0J1/UGcWNGNfYlcfcq/pIbi
X-Google-Smtp-Source: AA6agR6Ckyoz4nVDwR7KXJbk3cH/sMw9PaPACpNIr4KZIUYOGs3sFnKp77JorSOPsdAX6n5U4ek0nA==
X-Received: by 2002:a05:6000:1a86:b0:226:fd9b:7357 with SMTP id f6-20020a0560001a8600b00226fd9b7357mr9534983wry.458.1662362152193;
        Mon, 05 Sep 2022 00:15:52 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:f365:27e9:453c:4c15? ([2a01:e0a:982:cbb0:f365:27e9:453c:4c15])
        by smtp.gmail.com with ESMTPSA id e2-20020a5d5942000000b00226f39d1a3esm8050055wri.73.2022.09.05.00.15.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Sep 2022 00:15:51 -0700 (PDT)
Message-ID: <6ceffaed-00c1-3b62-9c0e-95349bfb2957@baylibre.com>
Date: Mon, 5 Sep 2022 09:15:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v6 2/4] docs/perf: Add documentation for the Amlogic G12
 DDR PMU
Content-Language: en-US
To: Jiucheng Xu <jiucheng.xu@amlogic.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Chris Healy <cphealy@gmail.com>, kernel test robot <lkp@intel.com>
References: <20220901024526.2833232-1-jiucheng.xu@amlogic.com>
 <20220901024526.2833232-2-jiucheng.xu@amlogic.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220901024526.2833232-2-jiucheng.xu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_001557_567451_9716DD37 
X-CRM114-Status: GOOD (  25.21  )
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

On 01/09/2022 04:45, Jiucheng Xu wrote:
> Add a user guide to show how to use DDR PMU to
> monitor DDR bandwidth on Amlogic G12 SoC
> 
> Signed-off-by: Jiucheng Xu <jiucheng.xu@amlogic.com>
> Reported-by: kernel test robot <lkp@intel.com>

Same as patch 1, please drop this Reported-by tags.

> ---
> Changes v6 -> v5:
>    - No change
> 
> Changes v5 -> v4:
>    - Fix building warning
> 
> Changes v3 -> v4:
>    - No change
> 
> Changes v2 -> v3:
>    - Rename doc name from aml-ddr-pmu.rst to meson-ddr-pmu.rst
> 
> Changes v1 -> v2:
>    - Nothing was changed
> ---
>   Documentation/admin-guide/perf/index.rst      |  1 +
>   .../admin-guide/perf/meson-ddr-pmu.rst        | 70 +++++++++++++++++++
>   MAINTAINERS                                   |  1 +
>   3 files changed, 72 insertions(+)
>   create mode 100644 Documentation/admin-guide/perf/meson-ddr-pmu.rst
> 
> diff --git a/Documentation/admin-guide/perf/index.rst b/Documentation/admin-guide/perf/index.rst
> index 69b23f087c05..997a28e156c1 100644
> --- a/Documentation/admin-guide/perf/index.rst
> +++ b/Documentation/admin-guide/perf/index.rst
> @@ -17,3 +17,4 @@ Performance monitor support
>      xgene-pmu
>      arm_dsu_pmu
>      thunderx2-pmu
> +   meson-ddr-pmu
> diff --git a/Documentation/admin-guide/perf/meson-ddr-pmu.rst b/Documentation/admin-guide/perf/meson-ddr-pmu.rst
> new file mode 100644
> index 000000000000..28e9910940d0
> --- /dev/null
> +++ b/Documentation/admin-guide/perf/meson-ddr-pmu.rst
> @@ -0,0 +1,70 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +===========================================================
> +Amlogic SoC DDR Bandwidth Performance Monitoring Unit (PMU)
> +===========================================================
> +
> +There is a bandwidth monitor inside the DRAM contorller. The monitor include
> +4 channels which can count the read/write request of accessing DRAM individually.
> +It can be helpful to show if the performance bottleneck is on DDR bandwidth.
> +
> +Currently, this driver supports the following 5 Perf events:
> +
> ++ meson_ddr_bw/total_rw_bytes/
> ++ meson_ddr_bw/chan_1_rw_bytes/
> ++ meson_ddr_bw/chan_2_rw_bytes/
> ++ meson_ddr_bw/chan_3_rw_bytes/
> ++ meson_ddr_bw/chan_4_rw_bytes/
> +
> +meson_ddr_bw/chan_{1,2,3,4}_rw_bytes/ events are the channel related events.
> +Each channel support using keywords as filter, which can let the channel
> +to monitor the individual IP module in SoC.
> +
> +The following keywords are the filter:
> +
> ++ arm             - DDR access request from CPU
> ++ vpu_read1       - DDR access request from OSD + VPP read
> ++ gpu             - DDR access request from 3D GPU
> ++ pcie            - DDR access request from PCIe controller
> ++ hdcp            - DDR access request from HDCP controller
> ++ hevc_front      - DDR access request from HEVC codec front end
> ++ usb3_0          - DDR access request from USB3.0 controller
> ++ hevc_back       - DDR access request from HEVC codec back end
> ++ h265enc         - DDR access request from HEVC encoder
> ++ vpu_read2       - DDR access request from DI read
> ++ vpu_write1      - DDR access request from VDIN write
> ++ vpu_write2      - DDR access request from di write
> ++ vdec            - DDR access request from legacy codec video decoder
> ++ hcodec          - DDR access request from H264 encoder
> ++ ge2d            - DDR access request from ge2d
> ++ spicc1          - DDR access request from SPI controller 1
> ++ usb0            - DDR access request from USB2.0 controller 0
> ++ dma             - DDR access request from system DMA controller 1
> ++ arb0            - DDR access request from arb0
> ++ sd_emmc_b       - DDR access request from SD eMMC b controller
> ++ usb1            - DDR access request from USB2.0 controller 1
> ++ audio           - DDR access request from Audio module
> ++ sd_emmc_c       - DDR access request from SD eMMC c controller
> ++ spicc2          - DDR access request from SPI controller 2
> ++ ethernet        - DDR access request from Ethernet controller
> +
> +
> +The following command is to show the total DDR bandwidth:
> +
> +  .. code-block:: bash
> +
> +      perf stat -a -e meson_ddr_bw/total_rw_bytes/ -I 1000 sleep 10
> +
> +This command will print the total DDR bandwidth per second.
> +
> +The following commands are to show how to use filter parameters:
> +
> +  .. code-block:: bash
> +
> +      perf stat -a -e meson_ddr_bw/chan_1_rw_bytes,arm=1/ -I 1000 sleep 10
> +      perf stat -a -e meson_ddr_bw/chan_2_rw_bytes,gpu=1/ -I 1000 sleep 10
> +      perf stat -a -e meson_ddr_bw/chan_3_rw_bytes,arm=1,gpu=1/ -I 1000 sleep 10
> +
> +The 1st command show how to use channel 1 to monitor the DDR bandwidth from ARM.
> +The 2nd command show using channel 2 to get the DDR bandwidth of GPU.
> +The 3rd command show using channel 3 to monitor the sum of ARM and GPU.
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ac8a98dfbacc..8ee68e699e6d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1054,6 +1054,7 @@ AMLOGIC DDR PMU DRIVER
>   M:	Jiucheng Xu <jiucheng.xu@amlogic.com>
>   S:	Supported
>   W:	http://www.amlogic.com
> +F:	Documentation/admin-guide/perf/meson-ddr-pmu.rst
>   F:	drivers/perf/amlogic/
>   F:	include/soc/amlogic/
>   

Thanks,
Neil

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
