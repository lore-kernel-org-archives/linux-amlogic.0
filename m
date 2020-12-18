Return-Path: <SRS0=hA9j=FW=lists.infradead.org=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54C86C4361B
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Dec 2020 09:50:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AE8723A84
	for <linux-amlogic@archiver.kernel.org>; Fri, 18 Dec 2020 09:50:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0AE8723A84
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tChrBJlbtKWQAPodDh3xzFrw9oQMW5Qt74shhmXnvy4=; b=mK8yTqSSp9obrAxcDcpk6JgcN
	STqbXZT1ddJdRv18Ht/cLHDfaVFK5ngwM+vxrFSt/uAKU63hepdUFeAu0DCdmkzNKY3U7CLhHryxY
	hgDX7qbwKPinOTOKn4mduGaWPx42MVnK6WdZ6hJQVB+GJapb0AwryPRzOog1ByJL09EbpPF9ZrGi2
	XlZc2tulGVkjULX8PgrgP9iuMkY6LDnYZC76GtS+6AFS4kZAPKEVfP3B8h3lxshNYGqYJ93IOdT4H
	dibfMuzD9ENfMBvdN5QkJslMmQFktG7wbm9i4wmHubDxHuT8sgt3HQqA2mM4jdUFCqKN9n2Qr3/Pg
	M5/Vrk+aw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kqCOw-0003Ec-Pl; Fri, 18 Dec 2020 09:50:18 +0000
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kqCOt-0003Dy-MW
 for linux-amlogic@lists.infradead.org; Fri, 18 Dec 2020 09:50:17 +0000
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
 by mx0b-001ae601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 0BI9l2Cm002296; Fri, 18 Dec 2020 03:50:03 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=+DbrQ5Y3H2OWg91wM1nYGA5xHFRnNWJLC9gVxMqCU70=;
 b=N7Js67CAOucvCreWgbF/qAg+ik8I0kux7RC4G7mtn+OxX+s8EZHviirgi7CIAO3GZYnb
 aXgYhiOxs8MOqIo9/T+Y2J4pN8KrI2nPyBa6QZ8mQPMPBaLAqqYg/aFXOKwtBt0CK2kZ
 3vlchgCw5zJBiXSDQQjqaMM/6uB15VW0v62BCVLA8ak4dW+Y/zafRbdZYBtjBmX00fC6
 ASTkF6ACIw2oyEga9UpqwPEMufBWj3vIavPZi0M0NnqhR7fnCXf8uL1nxbUVO/6rbYs9
 GJ0r6lKxsuPC9cILnVdkWI+aG/dGwxipeUCXo+0VqRcwGiy7BSk2aXOQ3BZncJGZP+R2 EQ== 
Received: from ediex01.ad.cirrus.com ([87.246.76.36])
 by mx0b-001ae601.pphosted.com with ESMTP id 35cu5ryxh8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Fri, 18 Dec 2020 03:50:03 -0600
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1913.5; Fri, 18 Dec
 2020 09:50:01 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.1913.5 via Frontend
 Transport; Fri, 18 Dec 2020 09:50:01 +0000
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6BCC711CA;
 Fri, 18 Dec 2020 09:50:01 +0000 (UTC)
Date: Fri, 18 Dec 2020 09:50:01 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH] ASoC: meson: axg-tdm-interface: fix loopback
Message-ID: <20201218095001.GF9673@ediswmail.ad.cirrus.com>
References: <20201217150812.3247405-1-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201217150812.3247405-1-jbrunet@baylibre.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 adultscore=0 mlxscore=0
 mlxlogscore=968 suspectscore=0 spamscore=0 clxscore=1011 malwarescore=0
 impostorscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2012180071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201218_045016_070609_3E5B9B25 
X-CRM114-Status: GOOD (  18.22  )
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
Cc: alsa-devel@alsa-project.org, Kevin Hilman <khilman@baylibre.com>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

On Thu, Dec 17, 2020 at 04:08:12PM +0100, Jerome Brunet wrote:
> When the axg-tdm-interface was introduced, the backend DAI was marked as an
> endpoint when DPCM was walking the DAPM graph to find a its BE.
> 
> It is no longer the case since this
> commit 8dd26dff00c0 ("ASoC: dapm: Fix handling of custom_stop_condition on DAPM graph walks")
> Because of this, when DPCM finds a BE it does everything it needs on the
> DAIs but it won't power up the widgets between the FE and the BE if there
> is no actual endpoint after the BE.
> 
> On meson-axg HWs, the loopback is a special DAI of the tdm-interface BE.
> It is only linked to the dummy codec since there no actual HW after it.
> >From the DAPM perspective, the DAI has no endpoint. Because of this, the TDM
> decoder, which is a widget between the FE and BE is not powered up.
> 
> >From the user perspective, everything seems fine but no data is produced.
> 
> Connecting the Loopback DAI to a dummy DAPM endpoint solves the problem.
> 
> Fixes: 8dd26dff00c0 ("ASoC: dapm: Fix handling of custom_stop_condition on DAPM graph walks")
> Cc: Charles Keepax <ckeepax@opensource.cirrus.com>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles

_______________________________________________
linux-amlogic mailing list
linux-amlogic@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-amlogic
