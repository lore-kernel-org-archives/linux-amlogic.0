Return-Path: <linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16888C25B75
	for <linux-amlogic@archiver.kernel.org>; Thu, 23 May 2024 15:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eZ2wbf6WrS9zbyRHJhPuYSAS2WN/aM2JHVm7iXLBkPM=; b=BsxxHA53GQFuZs
	Z7TMkHTgMQB6oz5URSxNZMMC5eQ1EzJ33OYcqT/Q54cLB4vpGbPhA2zqYCrqwkQ+eSoN22vpaQNP5
	vFQu1cq7z8CSuvksuEyM48IFlISyBM5CfFcU+LgY3iazLhHngC7wAmrQI30haMXxsLrtDNarCB729
	SFCbIldesSXW7EDoew/8DjNpyb0Gn7QwkXQE3Qby5MCyQMjtA/ONrS6IapgcIlqrE1dN8TL3hxVMC
	/H6kBVrdwwogW/KTwFICO5M76NffyHVSiENSvdb+WFq0OzFZMGnLcBe2FQEGJyqmtN+aEzOfNegAJ
	vxspLeEoa4Tf+2Fnm2Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAAqE-00000006jaG-3eNZ;
	Thu, 23 May 2024 15:58:54 +0000
Received: from [137.220.133.48] (helo=mail0.gc412.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAAqA-00000006jYc-18ew
	for linux-amlogic@lists.infradead.org;
	Thu, 23 May 2024 15:58:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=default; d=gc412.com;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:
 Content-Transfer-Encoding; i=no-reply@gc412.com;
 bh=q2OG43l9XizDnw2zUsKMxMt8mLge3arboJTz3yP9RuU=;
 b=XZZqqo7StbxJqEhZ7dkEWJFroUdkNuETop+pP3ZTtyseBjECUOpXgTTE88UbfcGfmVLxStYypa6F
   jtcPr+cdXoEo52Ytc3CZ9uEWt9AqnIpOPKsH0vNswjZLO2TyyZ64XoEVsKr8RTOY25Kbol/dGL0e
   gKBm8qZhIYxp5ib/X4w=
From: =?utf-8?B?6Ieq5YuV44Oh44O844Or6YCa55+l?= <no-reply@gc412.com>
To: =?utf-8?B?bGludXgtYW1sb2dpY0BsaXN0cy5pbmZyYWRlYWQub3Jn?= <linux-amlogic@lists.infradead.org>
Subject: =?utf-8?B?44CQ5LiJ5LqV5L2P5Y+L44Kr44O844OJ44CR5rG65riI5a6M?=
	=?utf-8?B?5LqG44Gu44GK55+l44KJ44Gb?=
Date: Thu, 23 May 2024 23:48:36 +0800
Message-ID: <OOMFNHFNEKGNDGJKJGEFLNPOHDCA.no-reply@gc412.com>
MIME-Version: 1.0
X-MSMail-Priority: Normal
Importance: Normal
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.2900.2180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_085850_777597_F5004EF2 
X-CRM114-Status: UNSURE (  -0.09  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-amlogic" <linux-amlogic-bounces@lists.infradead.org>
Errors-To: linux-amlogic-bounces+linux-amlogic=archiver.kernel.org@lists.infradead.org

5LiJ5LqV5L2P5Y+L44Kr44O844OJ44Kv44Op44K344OD44Kv4oC75Lya5ZOhICAgbGludXgtYW1s
b2dpY0BsaXN0cy5pbmZyYWRlYWQub3JnDQoNCuOBk+OBruOBn+OBs+OBr+S4ieS6leS9j+WPi+OC
q+ODvOODieOCkuOBlOWIqeeUqOOBhOOBn+OBoOOBjeOAgeiqoOOBq+OBguOCiuOBjOOBqOOBhuOB
lOOBluOBhOOBvuOBmeOAgg0K5pio5pel44CB44GK5a6i5qeY44Gu44Kv44Os44K444OD44OI44Kr
44O844OJ44Gn5raI6LK75pSv5Ye644GM55m655Sf44GX44Gf44GT44Go44KS44GK55+l44KJ44Gb
44GE44Gf44GX44G+44GZ44CCDQrjgZ3jga7mlK/miZXjgYTjga7oqbPntLDjga/mrKHjga7jgajj
gYrjgorjgafjgZnjgIINCiAg44GUIOWIqSDnlKgg5pelIOaZgiDvvJogMjAyNOW5tDXmnIgyM+aX
pSAyMzo0OQ0KICDjgZQg5YipIOeUqCDloLQg5omAIO+8miDljYPku6PnlLDkuIDjg4TmqYsgMyDk
uIHnm67lupcgKCDjgrsg44OWIOODsyDjgqQg44OsIOODliDjg7MgKQ0KICDjgZQg5YipIOeUqCDp
h5Eg6aGNIO+8miAxNzUzMCDlhoYNCg0K44Kr44O844OJ44KS5L2/55So44GX44Gf6Kaa44GI44GM
44Gq44GE5aC05ZCI44Gv44CB5Lul5LiL44Gu44Oq44Oz44Kv44KS44Kv44Oq44OD44Kv44GX44Gm
44Kv44Os44K444OD44OIIOOCq+ODvOODieaUr+aJleOBhOOBruaJv+iqjeOCkuOCreODo+ODs+OC
u+ODq+OBl+OBpuOBj+OBoOOBleOBhOOAgg0KaHR0cHM6Ly9kYXZlYW5kYWwuY29tDQoNCuS4iSDk
upUg5L2PIOWPiyBORVTjgavjgZTnmbvpjLLjgYTjgZ/jgaDjgYTjgabjgYTjgovjg6Hjg7zjg6vj
gqLjg4njg6zjgrnjgbjjgYrnn6XjgonjgZvjgZnjgovjgrXjg7zjg5PjgrnjgafjgZnjgIINCi0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tDQrilqAg55m6IOihjCDogIUg4pagDQrk
uInkupXkvY/lj4vjgqvjg7zjg4nmoKog5byPIOS8miDnpL4NCuOAkjEzNS0wMDYxIOadseS6rOmD
veaxn+adseWMuuixiua0sjLkuIHnm64y55WqMzHlj7cNCkNvcHlyaWdodCBAIFN1bWl0b21vIE1p
dHN1aSBDYXJkIENvcnBvcmF0aW9uLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1hbWxvZ2ljIG1haWxpbmcgbGlzdApsaW51eC1hbWxvZ2ljQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1hbWxvZ2ljCg==
