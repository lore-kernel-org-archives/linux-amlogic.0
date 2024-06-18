Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A6AC27C4F
	for <linux-amlogic@archiver.kernel.org>; Tue, 18 Jun 2024 17:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b2z12K2TXulLVxylG+yw3Ymao8laODarCzWD2IqhiVw=; b=fTJyGy3ntqyHpt
	mmJNtfK74dlFI2zDloaCFA1XhvXKh69wRgXAZcitdXZAAkV47EG5C/Ak9iXkz3qWHE4SRn8wviRzq
	aPjKhfETF0PIcj8LBt6Ks6c5sn+VmBRFxc/kMcadLGyvN5nBSmqUEF3OBCfeZzcGHwxYAqlODXwdQ
	RY/fB9MkSEXDYX95E7M3nknjNoP/42TkYA3/9gEbh4eXZzPK31IKvKQWpu1Ngp/h5661SyipMnE4l
	+yfNWxtOCf79JXtPtj+umHiRcZA0zYJ80IhG+5SChZHBJHD/TIGb7U19AXtJm15wncqZehyrh79L8
	23907WIVLKfBFUtR/CqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJd0c-0000000G6UP-07Xj;
	Tue, 18 Jun 2024 17:52:42 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJd0Y-0000000G6TY-01PQ;
	Tue, 18 Jun 2024 17:52:41 +0000
Received: from p-infra-ksmg-sc-msk01.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 61459100016;
	Tue, 18 Jun 2024 20:52:29 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 61459100016
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1718733149;
	bh=5TjeYJIhyXVCbtW4EgmHOFsDZbAMP7EgSVrBNOOHR9g=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From;
	b=EQtmLmB5bWg+RdiajBbBReyay3nqp9amTcITVHIb67cFVUMJ4A98E4o2rHTid60ki
	 rie8Nxts2xJbLTDMyQF8HTYYk26uyG1DjGgww1SSuYAs1ii05wWfTqH/D0NNgW7P7f
	 SAZik9tWWBPOW+6o8gkoOCzK7//aTbf5Z3ljR1LYluQog3za0huJWYtqLBS6baCEEw
	 MygAPEEM4VjdQDmd59pUasIGcGrITG+An3k4HrryRQhXUlRrfPqW55V2kKIj7rQeid
	 UBhxfJS6IiUf1bdoIHa8gRVhD5+lkUisRstIo6AEJoCi46IMMSGvpptdb9breuMRM2
	 yRiXN7HVz1d/g==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m02.sberdevices.ru [172.16.192.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Tue, 18 Jun 2024 20:52:29 +0300 (MSK)
Received: from localhost (100.64.160.123) by p-i-exch-sc-m02.sberdevices.ru
 (172.16.192.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 18 Jun
 2024 20:52:28 +0300
Date: Tue, 18 Jun 2024 20:52:28 +0300
From: Dmitry Rokosov <ddrokosov@salutedevices.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
CC: Kevin Hilman <khilman@baylibre.com>, Arnd Bergmann <arnd@kernel.org>, Arnd
 Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jerome Brunet
	<jbrunet@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Igor Prusov
	<ivprusov@salutedevices.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-amlogic@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: amlogic: ad402: move thermal-zones to top
 node
Message-ID: <20240618175134.bzw22uthyvw55rfc@CAB-WSD-L081021>
References: <20240528133215.2266419-1-arnd@kernel.org>
 <171766520046.3911343.14113541266786791367.b4-ty@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <171766520046.3911343.14113541266786791367.b4-ty@linaro.org>
User-Agent: NeoMutt/20220415
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m02.sberdevices.ru (172.16.192.103) To
 p-i-exch-sc-m02.sberdevices.ru (172.16.192.103)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 185993 [Jun 18 2024]
X-KSMG-AntiSpam-Version: 6.1.0.4
X-KSMG-AntiSpam-Envelope-From: ddrokosov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 20 0.3.20 743589a8af6ec90b529f2124c2bbfc3ce1d2f20f, {Tracking_uf_ne_domains}, {Track_E25351}, {Tracking_from_domain_doesnt_match_to}, salutedevices.com:7.1.1;127.0.0.199:7.1.2;100.64.160.123:7.1.2;git.kernel.org:7.1.1;smtp.sberdevices.ru:7.1.1,5.0.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1, FromAlignment: s, ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2024/06/18 16:18:00
X-KSMG-LinksScanning: Clean, bases: 2024/06/18 16:17:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/06/18 16:19:00 #25649051
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_105238_908941_745EAD80 
X-CRM114-Status: GOOD (  20.45  )
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

On Thu, Jun 06, 2024 at 11:13:20AM +0200, Neil Armstrong wrote:
> Hi,
> 
> On Tue, 28 May 2024 15:31:59 +0200, Arnd Bergmann wrote:
> > It appears that this accidentally got added into the spi node, causing
> > a warning.
> > 
> > arch/arm64/boot/dts/amlogic/meson-a1-ad402.dts:119.16-161.4: Warning (spi_bus_reg): /soc/spi@fd000400/thermal-zones: missing or empty reg property
> > 
> > 
> 
> Thanks, Applied to https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git (v6.11/arm64-dt)
> 
> [1/1] arm64: dts: amlogic: ad402: move thermal-zones to top node
>       https://git.kernel.org/amlogic/c/6c9b5ba73ca77ef3863cda6560856fdfe7dc237a
> 
> These changes has been applied on the intermediate git tree [1].
> 
> The v6.11/arm64-dt branch will then be sent via a formal Pull Request to the Linux SoC maintainers
> for inclusion in their intermediate git branches in order to be sent to Linus during
> the next merge window, or sooner if it's a set of fixes.
> 
> In the cases of fixes, those will be merged in the current release candidate
> kernel and as soon they appear on the Linux master branch they will be
> backported to the previous Stable and Long-Stable kernels [2].
> 
> The intermediate git branches are merged daily in the linux-next tree [3],
> people are encouraged testing these pre-release kernels and report issues on the
> relevant mailing-lists.
> 
> If problems are discovered on those changes, please submit a signed-off-by revert
> patch followed by a corrective changeset.
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git
> [3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git

My apologies for any confusion, it seems like these are artifacts from
the merge process...

-- 
Thank you,
Dmitry

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
