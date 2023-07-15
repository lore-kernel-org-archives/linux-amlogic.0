Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7911CC001DF
	for <linux-amlogic@archiver.kernel.org>; Sat, 15 Jul 2023 11:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=I7lpkn8VNFnSCSjzRBSM/7ARR+xiRmG9VaNWLwMcYWo=; b=sK6Cwi9wTaSVhn
	7jdkjxTiNK58bGc3ghmvo4E2bdw+4voQX+zvi3fkqG4CDfTjbRIeJ2sb/LE6iz3u14vfCigmoCjEs
	HB1wpUwDZu2SclJM/DSNfnHjRXuyFlzK3k3I+eJtKEofzfGdfcIjA19c3HPP2N5PIe/lwH/fs/uj/
	sZZfi98n6ciScgIFd8VpyETm32cKYqy5PKHIY1WOhsNmGou2moHJV5g/Lnb+u8K++gWb1c+7i0qCq
	GkSPmjOOey28yFBxSIvWutFRKBAIZpdKnugSe59gTGUV9UcAOo7rv2GqaPDYMu+8FphCoDdVaCvYt
	1Ask6ctxgMxTTK+FxkSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKd7N-008XNx-2p;
	Sat, 15 Jul 2023 11:07:17 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKd7I-008XKh-09;
	Sat, 15 Jul 2023 11:07:15 +0000
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id D7A1F100005;
	Sat, 15 Jul 2023 14:07:02 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru D7A1F100005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sberdevices.ru;
	s=mail; t=1689419222;
	bh=DW++SCgcxwIjmRUMsxVsWA8vee4FRUorFqSKgGAnm5g=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:From;
	b=RAVAdQgyO96POnt/ovs5pN3Xx70UA5jxwWI3bLfn0GJagZ2V+jz1cCwKl4JSgehtI
	 8FVflHNL3jRqS7UCpiMgOz4A3cQMPE9kNTw2CiK+M5IXNpAJToy8OoPAPzra6iZVvg
	 amGSIA/W2rout6hgBVUg+Rkem85+SHODE8rmpAQiS2WfOwM+xrrIQUHkM5vkM8QHv3
	 y1HtjPAKAa4KZETc2wDrFBm0sxJpw2LCEAEXa62nUNtKL1SckxwdaJVAzP31zXtyyq
	 eh3O/2+brGdKVulnH08pAbZzKkVcOf3q6gc8gRLfUgFAO5HlOl4ONdw409pLXAvsj3
	 3dRWRVjLolMtg==
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Sat, 15 Jul 2023 14:07:02 +0300 (MSK)
Received: from localhost.localdomain (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Sat, 15 Jul 2023 14:06:22 +0300
From: George Stark <gnstark@sberdevices.ru>
To: <jic23@kernel.org>, <lars@metafoo.de>, <neil.armstrong@linaro.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <andriy.shevchenko@linux.intel.com>,
	<nuno.sa@analog.com>, <gnstark@sberdevices.ru>
CC: <linux-iio@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<kernel@sberdevices.ru>
Subject: [PATCH v1 0/3] iio: adc: meson: tune init sequence
Date: Sat, 15 Jul 2023 14:05:57 +0300
Message-ID: <20230715110654.6035-1-gnstark@sberdevices.ru>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 178635 [Jul 15 2023]
X-KSMG-AntiSpam-Version: 5.9.59.0
X-KSMG-AntiSpam-Envelope-From: GNStark@sberdevices.ru
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 523 523 523027ce26ed1d9067f7a52a4756a876e54db27c, {Tracking_from_domain_doesnt_match_to}, sberdevices.ru:5.0.1,7.1.1;100.64.160.123:7.1.2;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1, FromAlignment: s, {Tracking_white_helo}, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2023/07/15 07:52:00 #21618415
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230715_040712_453003_7D89E68E 
X-CRM114-Status: UNSURE (   9.69  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

This patch is a part of effort to support meson a1 SoC and make meson saradc driver
independent from vendor boot code initialization in common.

Information was taken from vendor kernel 5.4, 4.19 and vendor uboot 2019.
Most of the bits are undocumented at all or it's not said how they affect measuring.

All those bits are already initialized in bl* code and since kernel driver dosn't
rewrite or reset any registers but only changes some bits at init stage everything
works fine.

Test procedure is rather simple - one can change those bits in runtime
(e.g. using devmem) and try to read channels (cat /sys/bus/platform/drivers/meson-saradc/.../iio:device0/*)
changing some of those bits leads to measure procedure errors or abnormal results.
Another test is build meson saradc as module, reset adc by reset bit, reload module
and compare measure results to those got before reset.

George Stark (3):
  iio: adc: meson: init channels 0,1 input muxes
  iio: adc: meson: init internal continuous ring counter
  iio: adc: meson: init voltage control bits

 drivers/iio/adc/meson_saradc.c | 73 ++++++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

-- 
2.38.4


_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
