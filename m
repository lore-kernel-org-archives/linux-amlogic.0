Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E6CFC43327
	for <linux-amlogic@archiver.kernel.org>; Wed,  1 Jul 2026 07:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vvR/1vQVFcQMdvv6J33iZGHpU0bKm3iFM782qXvr8m8=; b=j5P/CiyJwvC8qS
	BgsVssNrpHctXHmqmhKhKFnlAARGH8eKwC/IaMVoiAqKqW7Vv7Dot+ZBUt8I8VJV3I02S4gPMDTwj
	Fr0R8uE9G1W4C4jQCdGaECCs5G37LBV277XXCnxhEKyY/LPUsnJGYJbWLAguVUSKPEWaVJ3NMSget
	dNDLTSQwv3zRT0a7RCLWFu4TFmvXxWMDe0+YWAkD3rCdO/+nH3pvCaIVXNyNN3AbivTRY+Cxc4stK
	z5SAB9XFHZyjgjluuhZ0VplMYvTSxs86iy3U7U22fsTyqlpM+r/cp7wFzSA1MKW4slLo5x4uQQ5oT
	TCPXwqvlam2m92EZj+/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wepLp-00000000tjm-2DgB;
	Wed, 01 Jul 2026 07:27:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wepLn-00000000tis-0Bk6
	for linux-amlogic@lists.infradead.org;
	Wed, 01 Jul 2026 07:27:16 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6615lYHJ058544
	for <linux-amlogic@lists.infradead.org>; Wed, 1 Jul 2026 07:27:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UjPiDRtkBxxHS008iG49oRhf0qpCD3AfI/FuawlGAtQ=; b=a6N2XewAv+horXnK
	nKkWBvQxpygYro9ayToWkB+R+7sHu+pSIFsh6CKOXOc+upk4XoQcHznfXwVh+2m8
	9UfxKuwo+PCvR3+N/+QowoQW8W6a8KHRalmB02z2+C4CNqnSR6JLYmHyb12wwsyV
	QDYySU/vWiSn8ZLRyKlpjinT8fpduIsElGhR8p5zyqf9QXo/4gVsb1zu38hcl8Fs
	QKDPDtCs8oknupQhU9oAy2ZVjmczQ72QkxGsLUn92OP2eTGzSFDpl17p0bPf6bmw
	1VplRXkA/PWjCHP4Al3Jc0ByNqnU1h0Ii7YW7pAzra/x5BSkc2HjbRU2tn4Yjs0B
	qK/V5w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4hfyb9j5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-amlogic@lists.infradead.org>; Wed, 01 Jul 2026 07:27:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e68cb7a3eso74174485a.2
        for <linux-amlogic@lists.infradead.org>; Wed, 01 Jul 2026 00:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782890833; x=1783495633; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UjPiDRtkBxxHS008iG49oRhf0qpCD3AfI/FuawlGAtQ=;
        b=L3LUzMcB52LPtvGTuVNjNMEmBTY8KQUwnxmLQyjcGT6zAdr9BmtwcC6k758rrIw6bk
         eBEAIXiNUa4komHy+dDitM1WsDQ8ksdoeouCo8f1SC1ewShu+in0HwyY1CYH4aUYl612
         sgdi8CHAbIfcGXknLsCzXORJtvapAybmALOEp5475K2EP/+uXkSm7EKexYWb1VL4K/o9
         +D2eQesY7u1SU/PQVVwFC0lvP+EsJFtRyFiPIKp4GMSzpA+xgScljkeVAGrtu2SRRcP9
         4FWcgX33dILHPmaZr6beRjUSNCiXDj/U9523GezCvv58nH5DcaEpVz2qgVR2vHMRIq+n
         g5eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782890833; x=1783495633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UjPiDRtkBxxHS008iG49oRhf0qpCD3AfI/FuawlGAtQ=;
        b=bI78QqFLPm2Ux7psEAT10eQbH2CaDWG8ZzLe+tykvIuHymWIWaHsxqsttvRadL/056
         CGsgtSQlLk4FdKDMHulPn6OzPLTNcLAg8oovE6b+uRV0L4qGBAN/sUvlkc9jZFHCdhGl
         l6KC4romK+Vn7gZkQpYFbuuN5etuBb82fr30LUglSBWahNyNNhw6iFdun/FHHvdYXE4t
         mesewbJ6lSDHN6Qk0HrAatds6XbG+KdGNUZAJKzzoAzQHs1xNP/32XLGDnKfFDbjCE/4
         e6lVI+NXLBEeOxYxfPn03hQD/pDuvikx2jUV4xkXXx/c3+9tILkKhjxtLeoPmWPRH/+N
         Hy3A==
X-Forwarded-Encrypted: i=1; AFNElJ8ux/IV0PgEmMlS3npFHoyWhk++HTkt9QW7OqzMw+HnCfG4DSd3jIain7zl394JNgE3cfywKMT1HF9HzvCX@lists.infradead.org
X-Gm-Message-State: AOJu0YwU0gMH1g8tLu+J1PblJH8ViNBKdW2C4VZZKZD4K4zglwnt5G4D
	GRVPNPfl9LepNqRX00bH4JSPQ+ler03dz/At7vii/2kDUS+zCl8aq8T5buG5AWWtJMJXo4sqMFp
	wEiyAyAtr+PVQRwaiqYqK/Eu8oBeSEcoUpAImOEGzOjH5UjR9phO8CuIpCENkbyFLDXjQ1pGpvQ
	==
X-Gm-Gg: AfdE7cllzM5Wv1rRPHiMtots9rP79fm3VU63qIEEAFgQJVFUiDHqn0vn/qNM+qJeShC
	k0UmSMD8g96GXj7zS6tagtKyubUZwFFHD+d1rGamMOragTplOsz/wsg7UkrsPFgiMAZcyXcV5r7
	p9Zt005lO2z5nB8Nt6mgohHJXTgdQvZQWYqyNRuxGTHjki0kjZ2btSGf75RGXHvr8Q+ylAHg0MQ
	Et66+a90gKi4FoyfiM+UM8A/+bl7STgLg+RuStXbGxBYrcDRY2Qi1DlowmNF2i3/qaVRWH4Tu5j
	LyBVOpON/B5prubNOC7keNdj5qjsP7SSgNv9MD7ygb2I5sut1kGo87DQxNhz/3pD+0Dc7/+whVT
	PwbKsdswAr1UQKVnQa05F1Bo2JYEB7yLLCFbUaM0=
X-Received: by 2002:a05:620a:1a19:b0:926:e8e6:3c34 with SMTP id af79cd13be357-92e78217161mr66560785a.21.1782890833328;
        Wed, 01 Jul 2026 00:27:13 -0700 (PDT)
X-Received: by 2002:a05:620a:1a19:b0:926:e8e6:3c34 with SMTP id af79cd13be357-92e78217161mr66556385a.21.1782890832668;
        Wed, 01 Jul 2026 00:27:12 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:4718:fd49:e3d7:676a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47566c0deacsm15559815f8f.26.2026.07.01.00.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 00:27:11 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Viacheslav Bocharov <v@baodeep.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Diederik de Haas <diederik@cknow-tech.com>, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/2] gpio: fix sleeping-in-atomic in shared-proxy; restore meson non-sleeping
Date: Wed,  1 Jul 2026 09:27:09 +0200
Message-ID: <178289081780.4972.9992474509894050572.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260625115718.1678991-1-v@baodeep.com>
References: <20260625115718.1678991-1-v@baodeep.com>
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=J5OaKgnS c=1 sm=1 tr=0 ts=6a44c151 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=1LRHIn5sqR3nmJZzQNMA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: poxMcmyD6bgdqs4AXzpg7epQasVHrSC7
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA3NSBTYWx0ZWRfX93WoBcif+og7
 GXmfEZQziYsvkXHUuHhd+VUrdDCZIEvPXlHLCN2RyxIZP8v7t+jxe41yKp7nAr96qq+LFzwt87O
 25uqb9/tS4GNLpHSg8MrBaMr07CyC8Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA3NSBTYWx0ZWRfX5T9xa9PuDH48
 gnsuEp300phkjp93BGKQwOGudBKabseOEOTBK7pLpWMSXJbrdFxz+TkaIlyw/EGl2fk7lJ0I98K
 ZZ7k2Qi0KVcge2nR1tZ1p0NEq9IK13FrdUfG7rCxLkDyapFR6ogMgXBjVTGqMTpctxi0HsTjw7f
 5UiVF0VQ5H7vrCiaV4OlcP5aVckqTIm3nTZYxlO0oMkDbrBr6O9CRKzxgogVJ0dhJ8x360VntUi
 4LJrpyrhS5Bpp0/JlRlqqxqkslAobWclpgimzXCgCOflChT9/giHzhMEJd688z5s+YV5/QKAf5C
 t1PB2Pn92BYP5SYYZXqJhRyDdVBWlb1HA2M2aGtnaeGjhx42xqvycrHUdc6wY1drKJGemvv/Hbr
 ZStjq98YY701YJeYiAqLxLFxM3RdfdJCs017ZWRwsWLt7i9Zi/UZt6ywEnjmnR+IZPz8yKBZPXl
 8xF1Ia0TUyxpDVcusxQ==
X-Proofpoint-GUID: poxMcmyD6bgdqs4AXzpg7epQasVHrSC7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_002715_197422_09F0F5E6 
X-CRM114-Status: GOOD (  11.18  )
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


On Thu, 25 Jun 2026 14:57:16 +0300, Viacheslav Bocharov wrote:
> gpio-shared-proxy chooses its descriptor lock (mutex vs spinlock) from
> the underlying chip's can_sleep, but under that lock it calls config and
> direction ops that reach sleeping pinctrl paths. On a controller with
> non-sleeping MMIO value ops the lock is a spinlock, so a sleeping call
> runs from atomic context:
> 
>   BUG: sleeping function called from invalid context
>     ... pinctrl_gpio_set_config <- gpiochip_generic_config
>     <- gpio_shared_proxy_set_config (voting spinlock held)
>     <- ... <- mmc_pwrseq_simple_probe
> 
> [...]

Applied, thanks!

[2/2] pinctrl: meson: restore non-sleeping GPIO access
      https://git.kernel.org/brgl/c/9777530157e7b82fd994327ff878c4245dadc931

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
